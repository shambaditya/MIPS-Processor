module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire cout_res1, cout_res2, overflow1, overflow2;
	wire [31:0] sum_res1, sum_res2;
	
	//calling the addition module
	addition my_addition1(.a(data_operandA[31:0]), .b(data_operandB[31:0]), .sum(sum_res1[31:0]), .cout(cout_res1), .overflow(overflow1));
	//calling the substraction module 
	substraction my_substraction1(.a(data_operandA[31:0]), .b(data_operandB[31:0]), .sum(sum_res2[31:0]), .cout(cout_res2), .overflow(overflow2));
	
	//1 bit 2:1 mux to select the overflow occured(output) based on the opcodes 00000 or 00001 
	muxes_1 my_mux1(.a(overflow1), .b(overflow2), .sel(ctrl_ALUopcode[0]), .out(overflow));
	
	//32 bit 2:1 mux to output either the substraction or addition result based on the opcodes 00000 or 00001 
	muxes_32 my_mux2(.a(sum_res1[31:0]), .b(sum_res2[31:0]), .sel(ctrl_ALUopcode[0]), .out(data_result[31:0]));
	
	      

endmodule
