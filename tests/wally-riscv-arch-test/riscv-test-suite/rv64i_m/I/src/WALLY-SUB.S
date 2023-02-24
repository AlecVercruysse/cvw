///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SUB.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-14 06:53:36.153689//
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

# Testcase 0:  rs1:x25(0x0000000000000000), rs2:x27(0x0000000000000000), result rd:x29(0x0000000000000000)
li x25, MASK_XLEN(0x0000000000000000)
li x27, MASK_XLEN(0x0000000000000000)
SUB x29, x25, x27
sd x29, 0(x6)

# Testcase 1:  rs1:x29(0x0000000000000000), rs2:x21(0x0000000000000001), result rd:x25(0xffffffffffffffff)
li x29, MASK_XLEN(0x0000000000000000)
li x21, MASK_XLEN(0x0000000000000001)
SUB x25, x29, x21
sd x25, 8(x6)

# Testcase 2:  rs1:x17(0x0000000000000000), rs2:x23(0xffffffffffffffff), result rd:x17(0x0000000000000001)
li x17, MASK_XLEN(0x0000000000000000)
li x23, MASK_XLEN(0xffffffffffffffff)
SUB x17, x17, x23
sd x17, 16(x6)

# Testcase 3:  rs1:x14(0x0000000000000001), rs2:x17(0x0000000000000000), result rd:x10(0x0000000000000001)
li x14, MASK_XLEN(0x0000000000000001)
li x17, MASK_XLEN(0x0000000000000000)
SUB x10, x14, x17
sd x10, 24(x6)

# Testcase 4:  rs1:x31(0x0000000000000001), rs2:x4(0x0000000000000001), result rd:x5(0x0000000000000000)
li x31, MASK_XLEN(0x0000000000000001)
li x4, MASK_XLEN(0x0000000000000001)
SUB x5, x31, x4
sd x5, 32(x6)

# Testcase 5:  rs1:x14(0x0000000000000001), rs2:x29(0xffffffffffffffff), result rd:x19(0x0000000000000002)
li x14, MASK_XLEN(0x0000000000000001)
li x29, MASK_XLEN(0xffffffffffffffff)
SUB x19, x14, x29
sd x19, 40(x6)

# Testcase 6:  rs1:x14(0xffffffffffffffff), rs2:x30(0x0000000000000000), result rd:x3(0xffffffffffffffff)
li x14, MASK_XLEN(0xffffffffffffffff)
li x30, MASK_XLEN(0x0000000000000000)
SUB x3, x14, x30
sd x3, 48(x6)

# Testcase 7:  rs1:x30(0xffffffffffffffff), rs2:x4(0x0000000000000001), result rd:x14(0xfffffffffffffffe)
li x30, MASK_XLEN(0xffffffffffffffff)
li x4, MASK_XLEN(0x0000000000000001)
SUB x14, x30, x4
sd x14, 56(x6)

# Testcase 8:  rs1:x3(0xffffffffffffffff), rs2:x4(0xffffffffffffffff), result rd:x14(0x0000000000000000)
li x3, MASK_XLEN(0xffffffffffffffff)
li x4, MASK_XLEN(0xffffffffffffffff)
SUB x14, x3, x4
sd x14, 64(x6)

# Testcase 9:  rs1:x1(0x27f9e728c618fc1e), rs2:x26(0xf45da406bbf9bb01), result rd:x15(0x339c43220a1f411d)
li x1, MASK_XLEN(0x27f9e728c618fc1e)
li x26, MASK_XLEN(0xf45da406bbf9bb01)
SUB x15, x1, x26
sd x15, 72(x6)

# Testcase 10:  rs1:x16(0xafb918c86e5bac20), rs2:x30(0x07b6e08e6ac1ca75), result rd:x28(0xa802383a0399e1ab)
li x16, MASK_XLEN(0xafb918c86e5bac20)
li x30, MASK_XLEN(0x07b6e08e6ac1ca75)
SUB x28, x16, x30
sd x28, 80(x6)

# Testcase 11:  rs1:x3(0x53125ffdf655860b), rs2:x12(0x40a978bfb8f8903b), result rd:x3(0x1268e73e3d5cf5d0)
li x3, MASK_XLEN(0x53125ffdf655860b)
li x12, MASK_XLEN(0x40a978bfb8f8903b)
SUB x3, x3, x12
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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SUB.S
// David_Harris@hmc.edu & Katherine Parry
