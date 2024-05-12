module mux_3x1 
	(
		input [31:0] a, b, c,
		input [1:0] selector,
		output reg [31:0] out
		);

	always @(*)
	  case(selector)
	  	2'b00: out=a;
	  	2'b01: out=b;
	  	2'b10: out=c;
	  	default: out=32'bxxxxxxxx;
	  endcase	

endmodule : mux_3x1	  
