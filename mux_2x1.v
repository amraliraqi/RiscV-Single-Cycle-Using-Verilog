module mux_2x1 (
	input sel,
	input [31:0] a, b,
	output [31:0] c
	);

    assign c = sel ? b:a ;

endmodule : mux_2x1    

