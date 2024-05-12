module IM 
	(
	input [31:0] A,
	output [31:0] RD
	);
	wire [31:2] address;
	reg [31:0] im [31:0];

	assign address=A[31:2];
	assign RD=im[address];
endmodule : IM	

`timescale 1ns/1ps
module IM_tb();
	reg [31:0] A;
	wire [31:0] RD;
	IM DUT(A, RD);

	initial begin
		#2 $readmemh("im.txt",DUT.im);
		repeat(10) begin
			A=$urandom_range(0,20);
			#2;
		end
		#2 $stop;
	end
endmodule : IM_tb	