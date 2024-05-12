module controlunit
	(
		input [6:0] opcode,
		input [2:0] Funct3,
		input Funct7_5,
		input zero,
		output RegWrite ,ALUSrc ,MemWrite, PCSrc,
		output [1:0] ImmSrc, ResultSrc,
		output [2:0] ALUControl
		);
	
	wire [1:0] ALUOp;
	maindecoder maindecoder (
		opcode,
		zero,
		RegWrite ,ALUSrc ,MemWrite, PCSrc,
		ImmSrc, ResultSrc ,ALUOp);
	alu_decoder alu_decoder (
		opcode[5],
		ALUOp,
		Funct3,
		Funct7_5,
		ALUControl);
endmodule : controlunit	
