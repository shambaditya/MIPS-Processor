module muxes_32(a, b, sel, out);

	input [31:0] a,b;
	input sel;
	output [31:0] out;
	
	muxes_16 my_mux1(.a(a[15:0]), .b(b[15:0]), .sel(sel), .out(out[15:0]));
	muxes_16 my_mux2(.a(a[31:16]), .b(b[31:16]), .sel(sel), .out(out[31:16]));

	
endmodule
