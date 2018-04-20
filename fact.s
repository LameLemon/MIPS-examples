#################################################
# Notes                                         #
# -----                                         #
# Find the factorial of the immediate value     #
# placed in register $t1. This only works for   #
# values up to 12. Thre return value is placed  #
# in register $s0.                              #
#################################################
# Code in C                                     #
# ----------                                    #
# int fact = 1;                                 #
# int n = 4;                                    #
# for(int i; i <= fact; i++)                    #
# {                                             #
#     fact = fact * i;                          #
# }                                             #
#################################################

.globl main

main:
   addi $s0, $0, 1        # s0 is our fact, return value
   addi $t1, $0, 4        # t1 is our n, our factorial to find
   addi $s1, $t1, 1       # our n is incremented by 1 for counting
   addi $t0, $t0, 1       # initialize our ocunter to 1

loop:
    beq $s1, $t0, end     # if our n is equal to the counter, done
    mult $s0, $t0         # multiply our factorial by the counter
    mflo $s0              # move lower 32 bits of resultsto s0
    addi $t0, $t0, 1      # i++, increment counter by one
    j loop                # jump to start of loop

end:
    addi $v0, $0, 10      # service call to exit
    syscall
