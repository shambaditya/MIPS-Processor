/*This is the module to check for overflow.
For signed numbers operands we know that i) adding 2 +tive operands results in a -tive result ii) adding 2 negatives results 
in a positive number. So we need to detect overflow based on these.
Hence in my logic i check the 32nd bit of operands a and b and the resultant sum. If a and b have the same sign but sum has
a different sign then overflow has definitely occured . for that we need to do a xor sum (checking sign for sum and first operand) and not(a xor b) 
(checking signs of both a and b)
*/


module overflow_check(a, b, sum, overflow);

	input a, b, sum ;
	output overflow;
	
	
	wire w1,w2,w3;
	
   xor xor_gate1(w1, a, sum);
   xor xor_gate2(w3, a, b);
   not not_gate2(w2, w3);
   and and_gate1(overflow, w1, w2);

	
endmodule
