module IDEX(clk, RsData, RtData, ALUOp, RdAddr, Shamt, funct, RegWrite, MemWrite, MemRead,
	Data_out, RdAddr_out, WB, M, EX);
	input clk;
	input [31:0] RsData, RtData;
	input [1:0] ALUOp;
	input [5:0] funct;
	input [4:0] RdAddr, Shamt;
	input RegWrite, MemWrite, MemRead;
	output reg [63:0] Data_out;
	output reg [4:0] RdAddr_out;
	output reg WB;
	output reg [1:0] M;
	output reg [12:0] EX;
	always@(posedge clk) begin
		Data_out = {RsData, RtData};
		RdAddr_out = RdAddr;
		WB = RegWrite;
		M = {MemWrite, MemRead};
		EX = {ALUOp, Shamt, funct};
	end
endmodule
