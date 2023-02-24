///////////////////////////////////////////
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLTU.S
// David_Harris@hmc.edu & Katherine Parry
// Created 2023-02-14 06:53:36.155782//
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

# Testcase 0:  rs1:x30(0x0000000000000000), rs2:x29(0x0000000000000000), result rd:x31(0x0000000000000000)
li x30, MASK_XLEN(0x0000000000000000)
li x29, MASK_XLEN(0x0000000000000000)
SLTU x31, x30, x29
sd x31, 0(x6)

# Testcase 1:  rs1:x18(0x0000000000000000), rs2:x21(0x0000000000000001), result rd:x11(0x0000000000000001)
li x18, MASK_XLEN(0x0000000000000000)
li x21, MASK_XLEN(0x0000000000000001)
SLTU x11, x18, x21
sd x11, 8(x6)

# Testcase 2:  rs1:x4(0x0000000000000000), rs2:x18(0xffffffffffffffff), result rd:x19(0x0000000000000001)
li x4, MASK_XLEN(0x0000000000000000)
li x18, MASK_XLEN(0xffffffffffffffff)
SLTU x19, x4, x18
sd x19, 16(x6)

# Testcase 3:  rs1:x29(0x0000000000000001), rs2:x5(0x0000000000000000), result rd:x31(0x0000000000000000)
li x29, MASK_XLEN(0x0000000000000001)
li x5, MASK_XLEN(0x0000000000000000)
SLTU x31, x29, x5
sd x31, 24(x6)

# Testcase 4:  rs1:x5(0x0000000000000001), rs2:x26(0x0000000000000001), result rd:x8(0x0000000000000000)
li x5, MASK_XLEN(0x0000000000000001)
li x26, MASK_XLEN(0x0000000000000001)
SLTU x8, x5, x26
sd x8, 32(x6)

# Testcase 5:  rs1:x11(0x0000000000000001), rs2:x17(0xffffffffffffffff), result rd:x8(0x0000000000000001)
li x11, MASK_XLEN(0x0000000000000001)
li x17, MASK_XLEN(0xffffffffffffffff)
SLTU x8, x11, x17
sd x8, 40(x6)

# Testcase 6:  rs1:x10(0xffffffffffffffff), rs2:x12(0x0000000000000000), result rd:x14(0x0000000000000000)
li x10, MASK_XLEN(0xffffffffffffffff)
li x12, MASK_XLEN(0x0000000000000000)
SLTU x14, x10, x12
sd x14, 48(x6)

# Testcase 7:  rs1:x22(0xffffffffffffffff), rs2:x2(0x0000000000000001), result rd:x28(0x0000000000000000)
li x22, MASK_XLEN(0xffffffffffffffff)
li x2, MASK_XLEN(0x0000000000000001)
SLTU x28, x22, x2
sd x28, 56(x6)

# Testcase 8:  rs1:x5(0xffffffffffffffff), rs2:x20(0xffffffffffffffff), result rd:x1(0x0000000000000000)
li x5, MASK_XLEN(0xffffffffffffffff)
li x20, MASK_XLEN(0xffffffffffffffff)
SLTU x1, x5, x20
sd x1, 64(x6)

# Testcase 9:  rs1:x5(0x13f2a37c64d02759), rs2:x14(0x12bdf75fb3c161c3), result rd:x10(0x0000000000000000)
li x5, MASK_XLEN(0x13f2a37c64d02759)
li x14, MASK_XLEN(0x12bdf75fb3c161c3)
SLTU x10, x5, x14
sd x10, 72(x6)

# Testcase 10:  rs1:x5(0x6ab015638cffbbb1), rs2:x19(0xed28508dbdaa3bfa), result rd:x14(0x0000000000000001)
li x5, MASK_XLEN(0x6ab015638cffbbb1)
li x19, MASK_XLEN(0xed28508dbdaa3bfa)
SLTU x14, x5, x19
sd x14, 80(x6)

# Testcase 11:  rs1:x8(0xa31034dd4c4b91fe), rs2:x15(0x15a5712c5ac4b6c7), result rd:x21(0x0000000000000000)
li x8, MASK_XLEN(0xa31034dd4c4b91fe)
li x15, MASK_XLEN(0x15a5712c5ac4b6c7)
SLTU x21, x8, x15
sd x21, 88(x6)

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
// ../wally-riscv-arch-test/riscv-test-suite/rv64i_m/I/src/WALLY-SLTU.S
// David_Harris@hmc.edu & Katherine Parry
