.globl factorial

.data
n: .word 8

.text
main:
    la t0, n     # t0 = the memory address of n, 0x1000 0000
    lw a0, 0(t0) # a0 = 0(t0) = 8
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    li s0, 1 # (sum)s0 = 1
    beq a0, s0, finish #if n = 1, return
    addi, sp, sp, -8
    sw ra, 0(sp) # push ra
    sw a0, 4(sp) # push a0
    addi a0, a0, -1
    jal ra, factorial # call factorial(n-1)
    lw ra, 0(sp) # pop ra
    lw t0, 4(sp) # pop a0
    mul a0, a0, t0
    addi sp, sp, 8
    
finish:
    ret
    
