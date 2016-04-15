## Move data between the coprocessor and the CPU
.data
fp1: .float 2.5
fp2: .double -0.75
        .text
        .globl main

main:   
        li      $t0,1           # $t0 <-- 1
                                # (move to the coprocessor)
        mtc1    $t0,$f0         # $f0 <-- $t0 
        
        l.s    $f1,fp1         # $f1 <-- 1.0
                                # (move from the coprocessor)
        mfc1    $a0,$f1         # $t1 <-- $f1 
        
        li      $v0,10          # exit
        syscall
