module register_file 
	(
		input clk,
		input [4:0] A1, A2, A3,
		input WE3,
		input [31:0] WD3,
		output [31:0] RD1, RD2
		);

	reg [31:0] rf [10:0];
	// Only the write operation is clocked
	always@(posedge clk) begin
		if(WE3)
			rf[A3] <= A3==5'd0 ? 32'd0 : WD3;
	end
	assign RD1= A1==5'd0 ? 32'd0:rf[A1];
	assign RD2= A2==5'd0 ? 32'd0:rf[A2];
endmodule : register_file