///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-ADD.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-14 06:53:36.152684//
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

# Testcase 0:  rs1:x20(0x0000000000000000), rs2:x10(0x0000000000000000), result rd:x26(0x0000000000000000)
li x20, MASK_XLEN(0x0000000000000000)
li x10, MASK_XLEN(0x0000000000000000)
ADD x26, x20, x10
sd x26, 0(x6)

# Testcase 1:  rs1:x28(0x0000000000000000), rs2:x5(0x0000000000000001), result rd:x31(0x0000000000000001)
li x28, MASK_XLEN(0x0000000000000000)
li x5, MASK_XLEN(0x0000000000000001)
ADD x31, x28, x5
sd x31, 8(x6)

# Testcase 2:  rs1:x30(0x0000000000000000), rs2:x13(0xffffffffffffffff), result rd:x26(0xffffffffffffffff)
li x30, MASK_XLEN(0x0000000000000000)
li x13, MASK_XLEN(0xffffffffffffffff)
ADD x26, x30, x13
sd x26, 16(x6)

# Testcase 3:  rs1:x10(0x0000000000000001), rs2:x30(0x0000000000000000), result rd:x24(0x0000000000000001)
li x10, MASK_XLEN(0x0000000000000001)
li x30, MASK_XLEN(0x0000000000000000)
ADD x24, x10, x30
sd x24, 24(x6)

# Testcase 4:  rs1:x28(0x0000000000000001), rs2:x31(0x0000000000000001), result rd:x22(0x0000000000000002)
li x28, MASK_XLEN(0x0000000000000001)
li x31, MASK_XLEN(0x0000000000000001)
ADD x22, x28, x31
sd x22, 32(x6)

# Testcase 5:  rs1:x26(0x0000000000000001), rs2:x4(0xffffffffffffffff), result rd:x17(0x0000000000000000)
li x26, MASK_XLEN(0x0000000000000001)
li x4, MASK_XLEN(0xffffffffffffffff)
ADD x17, x26, x4
sd x17, 40(x6)

# Testcase 6:  rs1:x28(0xffffffffffffffff), rs2:x26(0x0000000000000000), result rd:x7(0xffffffffffffffff)
li x28, MASK_XLEN(0xffffffffffffffff)
li x26, MASK_XLEN(0x0000000000000000)
ADD x7, x28, x26
sd x7, 48(x6)

# Testcase 7:  rs1:x2(0xffffffffffffffff), rs2:x26(0x0000000000000001), result rd:x13(0x0000000000000000)
li x2, MASK_XLEN(0xffffffffffffffff)
li x26, MASK_XLEN(0x0000000000000001)
ADD x13, x2, x26
sd x13, 56(x6)

# Testcase 8:  rs1:x15(0xffffffffffffffff), rs2:x12(0xffffffffffffffff), result rd:x25(0xfffffffffffffffe)
li x15, MASK_XLEN(0xffffffffffffffff)
li x12, MASK_XLEN(0xffffffffffffffff)
ADD x25, x15, x12
sd x25, 64(x6)

# Testcase 9:  rs1:x21(0x7499b28c30c32323), rs2:x3(0xca20854d5b471c43), result rd:x31(0x3eba37d98c0a3f66)
li x21, MASK_XLEN(0x7499b28c30c32323)
li x3, MASK_XLEN(0xca20854d5b471c43)
ADD x31, x21, x3
sd x31, 72(x6)

# Testcase 10:  rs1:x16(0xe6e4b8df0b6d9611), rs2:x9(0x0a3c2c6fef2d9a38), result rd:x29(0xf120e54efa9b3049)
li x16, MASK_XLEN(0xe6e4b8df0b6d9611)
li x9, MASK_XLEN(0x0a3c2c6fef2d9a38)
ADD x29, x16, x9
sd x29, 80(x6)

# Testcase 11:  rs1:x7(0xf1dd50bf06d2ed7c), rs2:x8(0xaaa079968522dc4e), result rd:x3(0x9c7dca558bf5c9ca)
li x7, MASK_XLEN(0xf1dd50bf06d2ed7c)
li x8, MASK_XLEN(0xaaa079968522dc4e)
ADD x3, x7, x8
sd x3, 88(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-ADD.S
// David_Harris@hmc.edu & Katherine Parry
