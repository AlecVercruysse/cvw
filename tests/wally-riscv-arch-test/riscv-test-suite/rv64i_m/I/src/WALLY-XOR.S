///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-XOR.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-14 06:53:36.156796//
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
///////////////////////////////////////////

#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV64I")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN

RVTEST_CASE(0,"//check ISA:=regex(.*64.*);check ISA:=regex(.*I.*);def TEST_CASE_1=True;",temp)


RVTEST_SIGBASE( x6, wally_signature)

# Testcase 0:  rs1:x12(0x0000000000000000), rs2:x21(0x0000000000000000), result rd:x31(0x0000000000000000)
li x12, MASK_XLEN(0x0000000000000000)
li x21, MASK_XLEN(0x0000000000000000)
XOR x31, x12, x21
sd x31, 0(x6)

# Testcase 1:  rs1:x17(0x0000000000000000), rs2:x2(0x0000000000000001), result rd:x13(0x0000000000000001)
li x17, MASK_XLEN(0x0000000000000000)
li x2, MASK_XLEN(0x0000000000000001)
XOR x13, x17, x2
sd x13, 8(x6)

# Testcase 2:  rs1:x14(0x0000000000000000), rs2:x1(0xffffffffffffffff), result rd:x14(0xffffffffffffffff)
li x14, MASK_XLEN(0x0000000000000000)
li x1, MASK_XLEN(0xffffffffffffffff)
XOR x14, x14, x1
sd x14, 16(x6)

# Testcase 3:  rs1:x31(0x0000000000000001), rs2:x24(0x0000000000000000), result rd:x29(0x0000000000000001)
li x31, MASK_XLEN(0x0000000000000001)
li x24, MASK_XLEN(0x0000000000000000)
XOR x29, x31, x24
sd x29, 24(x6)

# Testcase 4:  rs1:x11(0x0000000000000001), rs2:x15(0x0000000000000001), result rd:x7(0x0000000000000000)
li x11, MASK_XLEN(0x0000000000000001)
li x15, MASK_XLEN(0x0000000000000001)
XOR x7, x11, x15
sd x7, 32(x6)

# Testcase 5:  rs1:x12(0x0000000000000001), rs2:x10(0xffffffffffffffff), result rd:x31(0xfffffffffffffffe)
li x12, MASK_XLEN(0x0000000000000001)
li x10, MASK_XLEN(0xffffffffffffffff)
XOR x31, x12, x10
sd x31, 40(x6)

# Testcase 6:  rs1:x16(0xffffffffffffffff), rs2:x3(0x0000000000000000), result rd:x31(0xffffffffffffffff)
li x16, MASK_XLEN(0xffffffffffffffff)
li x3, MASK_XLEN(0x0000000000000000)
XOR x31, x16, x3
sd x31, 48(x6)

# Testcase 7:  rs1:x9(0xffffffffffffffff), rs2:x4(0x0000000000000001), result rd:x18(0xfffffffffffffffe)
li x9, MASK_XLEN(0xffffffffffffffff)
li x4, MASK_XLEN(0x0000000000000001)
XOR x18, x9, x4
sd x18, 56(x6)

# Testcase 8:  rs1:x20(0xffffffffffffffff), rs2:x23(0xffffffffffffffff), result rd:x5(0x0000000000000000)
li x20, MASK_XLEN(0xffffffffffffffff)
li x23, MASK_XLEN(0xffffffffffffffff)
XOR x5, x20, x23
sd x5, 64(x6)

# Testcase 9:  rs1:x8(0xb3dd77e1cbb02fe9), rs2:x31(0xeda2fc4c7237d420), result rd:x15(0x5e7f8badb987fbc9)
li x8, MASK_XLEN(0xb3dd77e1cbb02fe9)
li x31, MASK_XLEN(0xeda2fc4c7237d420)
XOR x15, x8, x31
sd x15, 72(x6)

# Testcase 10:  rs1:x12(0xefe6171b5723a959), rs2:x15(0x247f4d9785fa2d5c), result rd:x21(0xcb995a8cd2d98405)
li x12, MASK_XLEN(0xefe6171b5723a959)
li x15, MASK_XLEN(0x247f4d9785fa2d5c)
XOR x21, x12, x15
sd x21, 80(x6)

# Testcase 11:  rs1:x7(0x1624d318a32652e8), rs2:x10(0xc149fa8e7bb8c2f1), result rd:x1(0xd76d2996d89e9019)
li x7, MASK_XLEN(0x1624d318a32652e8)
li x10, MASK_XLEN(0xc149fa8e7bb8c2f1)
XOR x1, x7, x10
sd x1, 88(x6)

.EQU NUMTESTS,12

RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0x98765432
RVTEST_DATA_END

RVMODEL_DATA_BEGIN


wally_signature:
    .fill NUMTESTS*(XLEN/32),4,0xdeadbeef

#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-XOR.S
// David_Harris@hmc.edu & Katherine Parry
