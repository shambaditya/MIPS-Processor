/*This is the 32-bit Carry Select Adder Module created from 16-bit carry select adders. So 
the implementation consists of 3 16-bit CSA modules doing the computation at the same time 
The first CSA block is doing the computation for the 0-15 bits 
The 2nd and the 3rd blocks are doing the computation for the 16-31 bits parallely with cin being 1 and 0 respectively 
Then we use a 2:1 16 bit mux with the select signal (for the mux) coming from the cout of the first 15 bits computation. 
to get the final computation.
There's also an 1 bit mux which basically chooses the cout of the module based on the select signal.
The advantage of using this 3 16-bit CSA blocks instead of using 3 16-bit ripple carry blocks is to reduce further delay.*/

module CSA_32(a, b, cin, sum, cout, overflow);

	input [31:0] a, b;
	input cin;
   output [31:0] sum;
   output cout, overflow;


   wire w1,w2,w3;
   wire [15:0] s1,s2;



   CSA_16 my_CSA1(.a(a[15:0]), .b(b[15:0]), .cin(cin), .sum(sum[15:0]), .cout(w1));
	
   CSA_16 my_CSA2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(s1), .cout(w2));
	CSA_16 my_CSA3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(s2), .cout(w3));
	
	muxes_16 my_mux1(.a(s1), .b(s2), .sel(w1), .out(sum[31:16]));

	muxes_1  mymux3(.a(w2), .b(w3), .sel(w1), .out(cout));
	//This using the 32nd bit (or nbits-1 here) of a, b and the computed sum to check for signed-overflow 
	overflow_check my_overflow1(.a(a[31]), .b(b[31]), .sum(sum[31]), .overflow(overflow));

	
   	
endmodule
