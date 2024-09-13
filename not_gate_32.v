/* This is not gate for performing inversion of each bit for b to be used in the 2's complement substraction
*/

module not_gate_32(a, a_not);

	input [31:0] a;
	output [31:0] a_not;
	
	genvar i;
	
	generate 
			for(i=0; i < 32; i=i+1) begin: not_gate_for_loop
				not not_gate1(a_not[i], a[i]);
			end
	endgenerate
	
endmodule

			