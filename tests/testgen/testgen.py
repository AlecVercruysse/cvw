#!/usr/bin/python3
##################################
# testgen.py
#
# David_Harris@hmc.edu 19 January 2021
#
# Generate directed and random test vectors for RISC-V Design Validation.
##################################

##################################
# libraries
##################################
from datetime import datetime
from random import randint 
from random import seed
from random import getrandbits

import pdb # debug this script

##################################
# functions
##################################

def twoscomp(a, xlen):
  amsb = a >> (xlen-1)
  alsbs = ((1 << (xlen-1)) - 1) & a
  if (amsb):
      asigned = a - (1<<xlen)
  else:
      asigned = a
  #print("a: " + str(a) + " amsb: "+str(amsb)+ " alsbs: " + str(alsbs) + " asigned: "+str(asigned))
  return asigned

def computeExpected(a, b, test, xlen):
  asigned = twoscomp(a, xlen)
  bsigned = twoscomp(b, xlen)

  if (test == "ADD"):
    return a + b
  elif (test == "SUB"):
    return a - b
  elif (test == "SLT"):
    return asigned < bsigned
  elif (test == "SLTU"):
    return a < b
  elif (test == "XOR"):
    return a ^ b
  elif (test == "OR"):
    return a | b
  elif (test == "AND"):
    return a & b
  elif (test == "SLL"):
    return a << (b & (xlen - 1)) # mask to lower 5/6 bits
  elif (test == "SRL"):
    return a << (b & (xlen - 1)) # mask to lower 5/6 bits
  elif (test == "SRA"):
    return asigned >> (b & (xlen - 1))
    # return (a >> b) if not (a & 2**(xlen-1)) else (a >> b) | (2**xlen-1 << min(0, (xlen - b)))

  else:
    print("warning: expected value not implemented for test: " + test)
    return 0xDEADBEEF
    # die("bad test name ", test)
  #  exit(1)

def randRegs():
  reg1 = randint(1,31)
  reg2 = randint(1,31)
  reg3 = randint(1,31) 
  if (reg1 == 6 or reg2 == 6 or reg3 == 6 or reg1 == reg2):
    return randRegs()
  else:
      return reg1, reg2, reg3

def writeVector_I_type(a, b, storecmd, xlen):
  global testnum, test
  reg1, _, reg3 = randRegs()

  if test in ["SLLI", "SRLI", "SRAI"]:
    # these instructions can accept an immmediate xlen-1
    immediate = b & (xlen-1)
  else:
    # these need to be masked to signed 12 bit
    immediate = b & (2**12 - 1)

    # immediate is a 12-bit signed number. We want to write
    # it in the instruction as a signed integer. So if
    # the sign bit is set, make it a negative number to python.
    if immediate & (2**11):
      immediate = twoscomp(immediate, 12)

  lines = "\n# Testcase " + str(testnum) + ":  rs1:x" + str(reg1) + "(" + formatstr.format(a)
  lines = lines + "), imm:x" + "(" + formatstr.format(immediate) 
  lines = lines + "), result rd:x" + str(reg3) + "(not computed)\n"
  lines = lines + "li x" + str(reg1) + ", MASK_XLEN(" + formatstr.format(a) + ")\n"  
  lines = lines + test + " x" + str(reg3) + ", x" + str(reg1) + ", " + "{:d}".format(immediate) + "\n"
  lines = lines + storecmd + " x" + str(reg3) + ", " + str(wordsize*testnum) + "(x6)\n"
  f.write(lines)
  testnum = testnum+1
  
def writeVector_R_type(a, b, storecmd, xlen):
  global testnum, test
  # ensure a and b are xlen wide. useful if testing word instructions.
  a = a % 2**xlen
  b = b % 2**xlen
  expected = computeExpected(a, b, test, xlen)
  expected = expected % 2**xlen # drop carry if necessary
  if (expected < 0): # take twos complement
    expected = 2**xlen + expected
  reg1, reg2, reg3 = randRegs()
  lines = "\n# Testcase " + str(testnum) + ":  rs1:x" + str(reg1) + "(" + formatstr.format(a)
  lines = lines + "), rs2:x" + str(reg2) + "(" +formatstr.format(b) 
  lines = lines + "), result rd:x" + str(reg3) + "(" + formatstr.format(expected) +")\n"
  lines = lines + "li x" + str(reg1) + ", MASK_XLEN(" + formatstr.format(a) + ")\n"
  lines = lines + "li x" + str(reg2) + ", MASK_XLEN(" + formatstr.format(b) + ")\n"
  lines = lines + test + " x" + str(reg3) + ", x" + str(reg1) + ", x" + str(reg2) + "\n"
  lines = lines + storecmd + " x" + str(reg3) + ", " + str(wordsize*testnum) + "(x6)\n"
#  lines = lines + "RVTEST_IO_ASSERT_GPR_EQ(x7, " + str(reg3) +", "+formatstr.format(expected)+")\n"
  f.write(lines)
  testnum = testnum+1

##################################
# main body
##################################

# change these to suite your tests
R_type_tests = ["ADD", "SUB", "SLT", "SLTU", "XOR",
         "AND", "OR", "SLL", "SRL", "SRA"]
I_type_tests = ["ADDI", "ANDI", "ORI", "XORI", "SLTI", "SLTIU", "SLLI", "SRLI", "SRAI"]
RW_64_tests = ["ADDW", "SUBW", "SLLW", "SRLW", "SRAW"] # 64-bit only

author = "David_Harris@hmc.edu & Katherine Parry"
xlens = [32, 64]
numrand = 3

# setup
seed(0) # make tests reproducible

# generate files for each test
for xlen in xlens:
  formatstrlen = str(int(xlen/4))
  formatstr = "0x{:0" + formatstrlen + "x}" # format as xlen-bit hexadecimal number
  formatrefstr = "{:08x}" # format as xlen-bit hexadecimal number with no leading 0x
  if (xlen == 32):
    storecmd = "sw"
    wordsize = 4
    rw_tests = []
  else:
    storecmd = "sd"
    wordsize = 8
    rw_tests = RW_64_tests
  for test in R_type_tests + I_type_tests + rw_tests:
    writeVector = writeVector_I_type if test in I_type_tests else writeVector_R_type
#    corners = [0, 1, 2, 0xFF, 0x624B3E976C52DD14 % 2**xlen, 2**(xlen-1)-2, 2**(xlen-1)-1, 
#            2**(xlen-1), 2**(xlen-1)+1, 0xC365DDEB9173AB42 % 2**xlen, 2**(xlen)-2, 2**(xlen)-1]
    corners = [0, 1, 2**(xlen)-1]
    pathname = "../wally-riscv-arch-test/riscv-test-suite/rv" + str(xlen) + "i_m/I/"
    basename = "WALLY-" + test 
    fname = pathname + "src/" + basename + ".S"
    testnum = 0

    # print custom header part
    f = open(fname, "w")
    line = "///////////////////////////////////////////\n"
    f.write(line)
    lines="// "+fname+ "\n// " + author + "\n"
    f.write(lines)
    line ="// Created " + str(datetime.now()) 
    f.write(line)

    # insert generic header
    h = open("testgen_header.S", "r")
    for line in h:  
      f.write(line)

    # print directed and random test vectors
    for a in corners:
      for b in corners:
        writeVector(a, b, storecmd, xlen if test not in rw_tests else 32)
    for i in range(0,numrand):
      a = getrandbits(xlen)
      b = getrandbits(xlen)
      writeVector(a, b, storecmd, xlen)


    # print footer
    line = "\n.EQU NUMTESTS," + str(testnum) + "\n\n"
    f.write(line)
    h = open("testgen_footer.S", "r")
    for line in h:  
      f.write(line)

    # Finish
#    lines = ".fill " + str(testnum) + ", " + str(wordsize) + ", -1\n"
#    lines = lines + "\nRV_COMPLIANCE_DATA_END\n" 
    f.write(lines)
    f.close()




