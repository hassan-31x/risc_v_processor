# Initialize array elements
addi x10, x0, 256
    addi x1, x0, 99
    addi x2, x0, 2
    addi x3, x0, 9
    addi x4, x0, 31
    addi x5, x0, 5
    addi x6, x0, 26
    addi x7, x0, 11
 
    # Base address of array in x10 = 0x100
 
    # Store array into memory
    sw x1, 0(x10)
    sw x2, 4(x10)
    sw x3, 8(x10)
    sw x4, 12(x10)
    sw x5, 16(x10)
    sw x6, 20(x10)
    sw x7, 24(x10)
 
    # Setup
    addi x11, x0, 7      # x11 = size
    addi x12, x0, 0      # x12 = i
 
outer_loop:
    addi x14, x11, -1
    bge x12, x14, exit   # if i >= size-1, exit
    addi x13, x0, 0      # x13 = j
 
inner_loop:
    sub x15, x11, x12    # x15 = size - i
    addi x15, x15, -1    # x15 = size - i - 1
    bge x13, x15, continue_outer
 
    # Multiply j by 4 manually (x16 = j * 4)
    add x16, x13, x13    # x16 = 2j
    add x16, x16, x13    # x16 = 3j
    add x16, x16, x13    # x16 = 4j
    add x16, x10, x16    # x16 = base + j*4
    # x18 = j + 1
    addi x18, x13, 1

    # Multiply (j+1) by 4 manually (x17 = (j+1) * 4)
    add x17, x18, x18    # x17 = 2*(j+1)
    add x17, x17, x18    # x17 = 3*(j+1)
    add x17, x17, x18    # x17 = 4*(j+1)
    add x17, x10, x17    # x17 = base + (j+1)*4
 
 
    lw x19, 0(x16)       # array[j]
    lw x20, 0(x17)       # array[j+1]
 
    blt x20, x19, do_swap
 
 
after_swap:
    addi x13, x13, 1
    beq x0, x0, inner_loop
 
 
do_swap:
    sw x20, 0(x16)
    sw x19, 0(x17)
    beq x0, x0, after_swap
 
 
continue_outer:
    addi x12, x12, 1
    beq x0, x0, outer_loop
 
 
exit: