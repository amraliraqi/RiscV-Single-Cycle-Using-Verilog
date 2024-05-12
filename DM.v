module dm 
	(
		input clk, we,
		input [31:0] a, wd,
		output [31:0] rd
		);

	reg [31:0] dm [100:0];
	assign rd=dm[a];
	always@(posedge clk)
	  if(we)
	  	dm[a] <= wd;
endmodule : dm	  
