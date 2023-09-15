module MEMWB(clk, WB, ALU_Result, RdAddr, WB_out, ALU_ResultOut, RdAddr_out);
	input clk;
	input WB;
	input[31:0] ALU_Result;
	input[4:0] RdAddr;
	output reg WB_out;
	output reg[31:0] ALU_ResultOut;
	output reg[4:0] RdAddr_out;
	always@(posedge clk)begin
		WB_out = WB;
		ALU_ResultOut = ALU_Result;
		RdAddr_out = RdAddr;
	end
endmodule
