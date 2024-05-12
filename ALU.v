module alu 
	(
		input [31:0] a, b,
		input [2:0] opcode,
		output reg [31:0] result,
		output zero
		);
	always @(*)
	  case(opcode)
	  	3'b000: result=a+b; //add
	    3'b001: result=a-b;//sub
	    3'b101: result=a<b?32'd1:32'h00000000;//slt
	    3'b011: result=a|b;//or
	    3'b010: result=a&b;//and
	    default:result=32'hxxxxxxxx;  //invalid input
	endcase

	assign zero= result==32'h00000000 ? 1'b1:1'b0;     
endmodule : alu