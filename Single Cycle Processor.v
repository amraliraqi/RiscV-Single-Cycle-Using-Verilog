module riscvsingle(
	input  clk, reset,
    output  [31:0] PC,
    input  [31:0] Instr,
    output  MemWrite,
    output [31:0] ALUResult, WriteData,
    input  [31:0] ReadData);

 wire ALUSrc, RegWrite, Jump, Zero;
 wire [1:0] ResultSrc, ImmSrc;
 wire [2:0] ALUControl;


controller c(Instr[6:0], Instr[14:12], Instr[30], Zero,
ResultSrc, MemWrite, PCSrc,
ALUSrc, RegWrite, Jump,
ImmSrc, ALUControl);

datapath dp(clk, reset, ResultSrc, PCSrc,
ALUSrc, RegWrite,
ImmSrc, ALUControl,
Zero, PC, Instr,
ALUResult, WriteData, ReadData);
endmodule
