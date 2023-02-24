///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLT.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-14 06:53:36.154739//
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

# Testcase 0:  rs1:x4(0x0000000000000000), rs2:x12(0x0000000000000000), result rd:x23(0x0000000000000000)
li x4, MASK_XLEN(0x0000000000000000)
li x12, MASK_XLEN(0x0000000000000000)
SLT x23, x4, x12
sd x23, 0(x6)

# Testcase 1:  rs1:x1(0x0000000000000000), rs2:x12(0x0000000000000001), result rd:x12(0x0000000000000001)
li x1, MASK_XLEN(0x0000000000000000)
li x12, MASK_XLEN(0x0000000000000001)
SLT x12, x1, x12
sd x12, 8(x6)

# Testcase 2:  rs1:x8(0x0000000000000000), rs2:x27(0xffffffffffffffff), result rd:x12(0x0000000000000000)
li x8, MASK_XLEN(0x0000000000000000)
li x27, MASK_XLEN(0xffffffffffffffff)
SLT x12, x8, x27
sd x12, 16(x6)

# Testcase 3:  rs1:x3(0x0000000000000001), rs2:x20(0x0000000000000000), result rd:x29(0x0000000000000000)
li x3, MASK_XLEN(0x0000000000000001)
li x20, MASK_XLEN(0x0000000000000000)
SLT x29, x3, x20
sd x29, 24(x6)

# Testcase 4:  rs1:x5(0x0000000000000001), rs2:x7(0x0000000000000001), result rd:x1(0x0000000000000000)
li x5, MASK_XLEN(0x0000000000000001)
li x7, MASK_XLEN(0x0000000000000001)
SLT x1, x5, x7
sd x1, 32(x6)

# Testcase 5:  rs1:x7(0x0000000000000001), rs2:x22(0xffffffffffffffff), result rd:x22(0x0000000000000000)
li x7, MASK_XLEN(0x0000000000000001)
li x22, MASK_XLEN(0xffffffffffffffff)
SLT x22, x7, x22
sd x22, 40(x6)

# Testcase 6:  rs1:x24(0xffffffffffffffff), rs2:x31(0x0000000000000000), result rd:x29(0x0000000000000001)
li x24, MASK_XLEN(0xffffffffffffffff)
li x31, MASK_XLEN(0x0000000000000000)
SLT x29, x24, x31
sd x29, 48(x6)

# Testcase 7:  rs1:x4(0xffffffffffffffff), rs2:x24(0x0000000000000001), result rd:x1(0x0000000000000001)
li x4, MASK_XLEN(0xffffffffffffffff)
li x24, MASK_XLEN(0x0000000000000001)
SLT x1, x4, x24
sd x1, 56(x6)

# Testcase 8:  rs1:x10(0xffffffffffffffff), rs2:x12(0xffffffffffffffff), result rd:x23(0x0000000000000000)
li x10, MASK_XLEN(0xffffffffffffffff)
li x12, MASK_XLEN(0xffffffffffffffff)
SLT x23, x10, x12
sd x23, 64(x6)

# Testcase 9:  rs1:x15(0xeecb325b064f768d), rs2:x4(0x3b9cea959ad7558f), result rd:x16(0x0000000000000001)
li x15, MASK_XLEN(0xeecb325b064f768d)
li x4, MASK_XLEN(0x3b9cea959ad7558f)
SLT x16, x15, x4
sd x16, 72(x6)

# Testcase 10:  rs1:x5(0xb51d70d8582dd972), rs2:x1(0x421aa15ef58c43ce), result rd:x31(0x0000000000000001)
li x5, MASK_XLEN(0xb51d70d8582dd972)
li x1, MASK_XLEN(0x421aa15ef58c43ce)
SLT x31, x5, x1
sd x31, 80(x6)

# Testcase 11:  rs1:x31(0x5cbbc08035475c5e), rs2:x10(0x792ecd7555c36c3d), result rd:x10(0x0000000000000001)
li x31, MASK_XLEN(0x5cbbc08035475c5e)
li x10, MASK_XLEN(0x792ecd7555c36c3d)
SLT x10, x31, x10
sd x10, 88(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLT.S
// David_Harris@hmc.edu & Katherine Parry
