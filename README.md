# PC1: ALU (Subtraction/Addition)
Shambaditya Tarafder 
netID : st496

# Design using 32 bit carry select adder

I used a 32 bit carry select adder(CSA) for all the computation requirements. 

First Implementation : At first I made module for 16-bits ripple carry adder using fuller adders. The final 32 bit carry select module was created using 3 blocks of 16-bit ripple carry adders computing paralelly 
                       at the same time. The first block of 16bit RCA  computed the sum for the 0-15bits. The 2nd and the 3rd block computed the sum for the 16-31 bits with the carry in values of 1 and 0 respectively.
                       The values for the 2nd and 3rd block are passed through the 16bit wide mux with select line coming from the computed first block. Similarly 1 bit mux was used for the final computation of the carry out 
                       value. Then it performs the overflow check by sending the 32nd bit of a ,b and the computed sum to the overflow-check module.[discussed later on]


Second Implementation(Final) : The implementation consists of 3 16-bit CSA modules doing the computation at the same time. The 16 bit CSA modules are inturn made up of 3 8-bits ripple carry adder modules. The 1st block is computing the values for 0-7 bits.                          The 2nd and the 3rd blocks are computing the values of 7-15 bits based on the cin values. Then I used a 2:1 8bit mux and a 2:1 1-bit mux to select values for the final computation. 
                               The first CSA block is doing the computation for the 0-15 bits. The 2nd and the 3rd blocks are doing the computation for the 16-31 bits parallely with cin being 1 and 0 respectively 
                               Then I used a 2:1 16 bit mux with the select signal (for the mux) coming from the cout of the first 15 bits computation to get the final computation.
                               There's also an 1 bit mux which basically chooses the cout of the module based on the select signal. The advantage of using this 3 16-bit CSA blocks instead of using 3 16-bit ripple carry
                               blocks is to reduce further delay.



# Addition module 

This is again pretty staright forward we call the final CSA 32 bit module to do the addition computation with the cin signal set to 0.

# Substraction module 

The subtraction module  utilizes the 2's complement concept to perform the computation The formulae :-  a + (-b)  that is a + (not b) + 1. Unlike the addition we first invert the b bits utilizing the not gate module (32 bits inversion using not gates) 
and set the c-input signal to 1 and the computation is sent to the CSA -32 bits module for the final result.

# Overflow-check module

For signed numbers operands we know that i) adding 2 +tive operands results in a -tive result ii) adding 2 negatives results 
in a positive number. So we need to detect overflow based on these. Hence in my logic I check the 32nd bit of operands a and b and the resultant sum. If a and b have the same sign but sum has
a different sign then overflow has definitely occured . for that we need to do [ a xor sum (checking sign for sum and first operand) and not(a xor b)  (for checking the signs of operand a and b) ]

# ALU

Finally in the alu module we perform the addition and substraction computation. Then I used a 32bit wide mux to select the final compuatation required based on the alu opcodes- 0000[0] or 0000[1]
Similarly, I used a 1bit mux to select the overflow occured from the computation(if they did) based on the alu opcodes mentioned above

# Additional Info 

- For the iversion of the second operand for the 2's complement substraction I used not gate for each bit inversion using generate- for-loop. I learned of implementation and this definitely eased a lot of work otherwise we
  I had to do each bit inversion manually :) 


