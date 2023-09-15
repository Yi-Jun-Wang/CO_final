module MEMWB(clk, WB, ALU_Result, MemReadData, RdAddr, WB_out, ALU_ResultOut, MemReadData_out, RdAddr_out);
	input clk;
	input[1:0] WB;
	input[31:0] ALU_Result, MemReadData;
	input[4:0] RdAddr;
	output reg[1:0] WB_out;
	output reg[31:0] ALU_ResultOut, MemReadData_out;
	output reg[4:0] RdAddr_out;
	always@(posedge clk)begin
		WB_out = WB;
		ALU_ResultOut = ALU_Result;
		MemReadData_out = MemReadData;
		RdAddr_out = RdAddr;
	end
endmodule
