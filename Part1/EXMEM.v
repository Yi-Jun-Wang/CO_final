module EXMEM(clk, WB, M, ALU_Result, RdAddr, WB_out, M_out, ALU_ResultOut, RdAddr_out);
	input clk;
	input WB;
	input[1:0] M;
	input[31:0] ALU_Result;
	input[4:0] RdAddr;
	output reg WB_out;
	output reg[1:0] M_out;
	output reg[31:0] ALU_ResultOut;
	output reg[4:0] RdAddr_out;
	always@(posedge clk)begin
		WB_out = WB;
		M_out = M;
		ALU_ResultOut = ALU_Result;
		RdAddr_out = RdAddr;
	end
endmodule
