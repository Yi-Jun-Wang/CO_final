module IDEX(clk, RsData, RtData, Immediate, ALUOp, RtAddr, RdAddr, Shamt, funct, RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg,
	Data_out, Immediate_out, RtAddr_out, RdAddr_out, WB, M, EX);
	input clk;
	input [31:0] RsData, RtData, Immediate;
	input [1:0] ALUOp;
	input [5:0] funct;
	input [4:0] RtAddr, RdAddr, Shamt;
	input RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg;
	output reg [63:0] Data_out;
	output reg [31:0] Immediate_out;
	output reg [4:0] RtAddr_out, RdAddr_out;
	output reg [1:0] WB;
	output reg [1:0] M;
	output reg [14:0] EX;
	always@(posedge clk) begin
		Data_out = {RsData, RtData};
		Immediate_out = Immediate;
		RtAddr_out = RtAddr;
		RdAddr_out = RdAddr;
		WB = {RegWrite, MemtoReg};
		M = {MemWrite, MemRead};
		EX = {RegDst, ALUSrc, ALUOp, Shamt, funct};
	end
endmodule
