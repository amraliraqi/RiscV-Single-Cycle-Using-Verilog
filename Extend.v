module extend 
	(
		input [31:0] Instr,
		input [1:0] immsrc,
		output reg [31:0] extended_imm
		);
	always@(*)
	  case(immsrc)
	  	0: extended_imm={{20{Instr[31]}}, Instr[31:20]};
	  	1: extended_imm={{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
	  	2: extended_imm={{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};
	  	3: extended_imm={{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0};
	  endcase	

endmodule : extend	  

