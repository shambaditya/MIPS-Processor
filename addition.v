/* This is simple addition module for the 32-bit addition/substraction circuit. It performs adding based on the cin signal 
which is 0 in this case for addition. It is then passed to the 32 bit CSA module to perfrm the necessary calculations.
*/

module addition(a, b, sum, cout, overflow);

	input [31:0] a, b;
   output [31:0] sum;
   output cout, overflow;
	
	wire w1, w2, w3;
  

   CSA_32 my_CSA1(.a(a[31:0]), .b(b[31:0]), .cin(1'b0), .sum(sum[31:0]), .cout(cout), .overflow(overflow));
	

endmodule

	
	