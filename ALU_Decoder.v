module alu_decoder
	(
		input Opcode5,
		input [1:0] ALUOp,
		input [2:0] Funct3,
		input Funct7_5,
		output reg [2:0] ALUControl
		);
	always@(*)
	  if(ALUOp==2'b00)
	  	ALUControl=3'b000; //lw, sw
	  else if(ALUOp==2'b01)
	  	ALUControl=3'b001; //beq
	  else
	  	casex({Funct3,Opcode5,Funct7_5})
	      5'b000_00,
	      5'b000_01,
	      5'b000_10: ALUControl=3'b000; //add
	      5'b000_11: ALUControl=3'b001; //sub
	      5'b010_xx: ALUControl=3'b101; //slt
	      5'b110_xx: ALUControl=3'b011; //or
	      5'b111_xx: ALUControl=3'b010; //and
	      default:   ALUControl=3'bxxx; //invalid input
	    endcase

endmodule : alu_decoder	      


