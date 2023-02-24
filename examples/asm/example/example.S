.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
        li a0, 42
        li a1, 2
        addw a0, a0, a1

self_loop:
    j self_loop
