module EXMEM(clk, WB, M, ALU_Result, RtData, RdAddr, WB_out, M_out, ALU_ResultOut, MemWriteData, RdAddr_out);
	input clk;
	input[1:0] WB;
	input[1:0] M;
	input[31:0] ALU_Result, RtData;
	input[4:0] RdAddr;
	output reg[1:0] WB_out;
	output reg[1:0] M_out;
	output reg[31:0] ALU_ResultOut, MemWriteData;
	output reg[4:0] RdAddr_out;
	always@(posedge clk)begin
		WB_out = WB;
		M_out = M;
		ALU_ResultOut = ALU_Result;
		MemWriteData = RtData;
		RdAddr_out = RdAddr;
	end
endmodule
