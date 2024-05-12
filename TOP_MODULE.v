module top_module (input clk, rst);
	wire [31:0] pc_next, pc;
	pcc pcc (clk, rst,pc_next,pc);
	wire [31:0] instr;
	IM IM (pc,instr);
	wire [31:0] pcplus4;
	adder adder4 (pc,32'd4,pcplus4);
	wire zero;
	wire RegWrite ,ALUSrc ,MemWrite, PCSrc;
	wire [1:0] ImmSrc, ResultSrc;
	wire [2:0] ALUControl;
	controlunit controlunit
	(
		instr[6:0],
		instr[14:12],
		instr[30],
		zero,
		RegWrite ,ALUSrc ,MemWrite, PCSrc,
		ImmSrc, ResultSrc,
		ALUControl
		);

    wire [31:0] srca, RD2;
    wire [31:0] result;
	register_file register_file 
	(
		clk,
		instr[19:15],
		instr[24:20],
		instr[11:7],
		RegWrite,
		result,
		srca, RD2
		);

	wire [31:0] extended_imm;
	extend extend 
	(
		instr,
		ImmSrc,
		extended_imm
		);

	wire [31:0]  srcb;
	mux_2x1 mux_2x1b (
	ALUSrc,
	RD2, extended_imm,
	srcb
	);

	wire [31:0] aluresult;
	alu alu 
	(
		srca, srcb,
		ALUControl,
		aluresult,
		zero
		);

	wire [31:0] pctarget;
	adder adder (pc,extended_imm,pctarget);

	wire [31:0] readata;

	dm dm 
	(
		clk, MemWrite,
		aluresult, RD2,
		readata
		);

	mux_3x1 mux_3x1 
	(
		aluresult, readata, pcplus4,
		ResultSrc,
		result
		);


	mux_2x1 mux_2x1a (
	PCSrc,
	pcplus4, pctarget,
	pc_next
	);

endmodule : top_module	


`timescale 1ns/1ps
module testbench ();
	reg clk, rst;
	top_module DUT(clk, rst);
	initial begin
		clk=0;
		forever #2 clk=~clk;
	end
	initial begin
		rst=1;
		repeat(2) @(negedge clk);
		rst=0;
		$readmemh("im.txt",DUT.IM.im);
		repeat(100) @(negedge clk);
		$stop;
	end
endmodule	