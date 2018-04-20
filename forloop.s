#################################################
# Notes                                         #
# -----                                         #
# Making a for loop in MIPS to increment $t2 by #
# by one, 5 times. The register $t2 is          #
# initialised with the immidiate value 4.       #
#################################################
# Code in C                                     #
# ----------                                    #
# int iterations = 5;                           #
# int i = 0;                                    #
# int val = 4;                                  #
# for(i = 0; i < iterations; i++)               #
# {                                             #
#     val += 1                                  #
# }                                             #
#################################################

.globl main

main:
    addi $t0, $0, 5        # iterations
    addi $t1, $0, 0        # t1 is i, our counter
    addi $t2, $0, 4        # t2 is val

loop:
    beq $t1, $t0, end      # if i == iterations go to end
    and $0, $0, $0         # NOP
    addi $t2, $t2, 1       # val += 1
    addi $t1, $t1, 1       # i++
    j loop                 # jumpt to start of loop

end:
    addi $v0, $0, 10       # service call to exit
    syscall
