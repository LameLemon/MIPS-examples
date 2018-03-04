#################################################
# Notes                                         #
# -----                                         #
# Multiplying two 32-bit registers can lead to  #
# a 64-bit result. The most significat 32-bits  #
# are stored in the hi register and the 32      #
# least significant bits are stored in the lo   #
# register. There are not directly addersable   #
# and so mfhi and mflo have to be used to move  #
# those bits adderssable registers.             #
#################################################
# Code in C                                     #
# ----------                                    #
# int i = 4;                                    #
# int j = 5;                                    #
# int x = i * j;                                #
#################################################

main:
    addi $t0, 4        # int i = 4
    addi $t1, 5        # int i = 5
    mult $t0, $t1      # i * j -> results in {Hi,Lo}
    mfhi $s0           # move upper 32-bits from Hi to s0
    mflo $s1           # move lower 32-bits from Lo to s1

    addi $v0, $0, 10   # service call to exit
    syscall
