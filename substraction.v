/* This is the subtraction module which utilizes the 2's complement concept to perform the computation
The formulae :- a + (-b)  that is a + (not b) + 1. Unlike the addition we first invert the b bits utilizing the not gate module
and set the c-input signal to 1 and the computation is sent to the CSA -32 bits.
*/


module substraction(a, b, sum, cout, overflow);

	input [31:0] a, b;
   output [31:0] sum;
   output cout, overflow;
   
	wire [31:0] b_not;
	wire w1, w2, w3;
   
	not_gate_32 my_not_gate1(.a(b[31:0]), .a_not(b_not[31:0]));
   CSA_32 my_CSA2(.a(a[31:0]), .b(b_not[31:0]), .cin(1'b1), .sum(sum[31:0]), .cout(cout), .overflow(overflow));
	

	
endmodule
