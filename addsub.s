#################################################
# Notes                                         #
# -----                                         #
# addi is used to add an immediate (constant)   #
# value to a register. To add two registers     #
# the add intruction is used.                   #
#################################################
# Code in C                                     #
# ----------                                    #
# int b = 5;                                    #
# int c = 10;                                   #
# int x = 4;                                    #
# int y = 1;                                    #
# a = (b + c) + (x - y);                        #
#################################################

.globl main

main:
    addi $s1, $0, 5        # s1 is b
    addi $s2, $0, 10       # s2 is c
    addi $s3, $0, 4        # s3 is x
    addi $s4, $0, 1        # s4 is y

    add $t0, $s1, $s2      # t0 is (b + c)
    sub $t1, $s3, $s4      # t1 is (x - y)
    add $s0, $t0, $t1      # s0 is (b + c) + (x - y)

    addi $v0, $0, 10       # service call to exit
    syscall
