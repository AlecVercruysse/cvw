// fir.S
// Alec V
// a0 has result length (15)
// a1 has window length (5)
// a2 has a pointer to the input  arr X
// a3 has a pointer to the window arr C
// a4 has a pointer to the result arr Y.
//
// t0 = i, increments through window
.global fir
fir:
        //addiw a7, zero, 42 // debug: to set a breakpoint in spike
        
        // set up stop condition for outer for loop,
        slli t6, a0, 3     // t1 = len(Y) * 8 (bytes)  
        add t1, t6, a4     // t1 = y + len(Y) * 8 (bytes)

        // set up stop condition for inner for loop,
        // keep 8*len(c)     in t5 to use later.
        // keep 8*(len(c)-1) in t6 to use later.
        slli t5, a1, 3     // t5 = len(C) * 8 (bytes)
        add t4, t5, a3     // t4 = c + len(C) * 8 (bytes)
        addi t6, t5, -8    // t6 = 8*(len(y) - 1)
        
        // iterate through each output. 
for:    beq a4, t1, done
        fmv.d.x f0, zero       // reset result reg.
        
fori:   beq a3, t4, donei
        // load *x and *y into fp regs,
        // preform fma, increment x & y
        fld f1, 0(a2)          // f1 = *x
        fld f2, 0(a3)          // f2 = *c
        fmadd.d f0, f1, f2, f0 // f0 = f1*f2 + f0
        addi a2, a2, 8         // x += 8
        addi a3, a3, 8         // c += 8
        j fori
donei:
        // reset & increment x pointer
        sub a2, a2, t6       // x -= x*(len(c)-1)
        // reset y pointer
        sub a3, a3, t5       // c -= 8*len(c)
        // store accumulation and increment y ptr
        fsd f0, 0(a4)        // *y = f0
        addi a4, a4, 8       // y++
        j for
done:   
        ret // return from function
