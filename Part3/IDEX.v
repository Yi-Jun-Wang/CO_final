module IDEX(clk, RsData, RtData, Immediate, ALUOp, RtAddr, RdAddr, RsAddr, Shamt, funct, RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg,
	Data_out, Immediate_out, RtAddr_out, RdAddr_out, RsAddr_out, WB, M, EX);
	input clk;
	input [31:0] RsData, RtData, Immediate;
	input [1:0] ALUOp;
	input [5:0] funct;
	input [4:0] RtAddr, RdAddr, RsAddr, Shamt;
	input RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg;
	output reg [63:0] Data_out = 0;
	output reg [31:0] Immediate_out = 0;
	output reg [4:0] RtAddr_out = 0, RdAddr_out = 0, RsAddr_out = 0;
	output reg [1:0] WB = 0;
	output reg [1:0] M = 0;
	output reg [14:0] EX = 0;
	always@(posedge clk) begin
		Data_out = {RsData, RtData};
		Immediate_out = Immediate;
		RtAddr_out = RtAddr;
		RdAddr_out = RdAddr;
		RsAddr_out = RsAddr;
		WB = {RegWrite, MemtoReg};
		M = {MemWrite, MemRead};
		EX = {RegDst, ALUSrc, ALUOp, Shamt, funct};
	end
endmodule
