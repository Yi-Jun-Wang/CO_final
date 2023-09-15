/*
 *	Template for Project 3 Part 2
 *	Copyright (C) 2021  Lee Kai Xuan or any person belong ESSLab.
 *	All Right Reserved.
 *
 *	This program is free software: you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation, either version 3 of the License, or
 *	(at your option) any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *	This file is for people who have taken the cource (1092 Computer
 *	Organizarion) to use.
 *	We (ESSLab) are not responsible for any illegal use.
 *
 */

/*
 * Declaration of top entry for this project.
 * CAUTION: DONT MODIFY THE NAME AND I/O DECLARATION.
 */
module I_PipelineCPU(
	// Outputs
	output	wire	[31:0]	AddrOut,
	// Inputs
	input	wire	[31:0]	AddrIn,
	input	wire			clk
);
	wire[31:0] Instr, Instr_out, RsData, RtData;
	wire[1:0] ALUOp;
	wire RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg;
	wire[63:0] Data_out;
	wire[4:0] RdAddr_out_EX, RtAddr_out_EX, RdAddr_out_MEM, RdAddr_out_WB;
	wire[1:0] WB_EX, WB_MEM, WB_WB;
	wire[1:0] M_EX, M_MEM;
	wire[14:0] EX;
	wire[31:0] ALU_Result;
	wire[5:0] Funct;
	wire[31:0] ALU_ResultOut_MEM, ALU_ResultOut_WB;
	wire[31:0] Immediate, Immediate_out, MemWriteData, MemReadData, MemReadData_out, mux1_out, mux2_out, mux3_out, mux4_out;
	assign Immediate = {{16{Instr_out[15]}}, Instr_out[15:0]};
	/* 
	 * Declaration of Instruction Memory.
	 * CAUTION: DONT MODIFY THE NAME.
	 */
	Adder Add1(4, AddrIn, AddrOut);
	IM Instr_Memory(
		// Outputs
		Instr,
		// Inputs
		AddrIn
	);
	IFID Register(clk, Instr, Instr_out);
	/* 
	 * Declaration of Register File.
	 * CAUTION: DONT MODIFY THE NAME.
	 */
	RF Register_File(clk, WB_WB[1], Instr_out[25:21], Instr_out[20:16], RdAddr_out_WB, mux4_out, RsData, RtData);
	
	Control C1(Instr_out[31:26], ALUOp, RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg);
	
	Mux_32bits mux1(0, {ALUOp, RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg}, 1, mux1_out);

	IDEX Register2(clk, RsData, RtData, Immediate, mux1_out[7:6], Instr_out[20:16], Instr_out[15:11], Instr_out[10:6], 
		Instr_out[5:0], mux1_out[5], mux1_out[4], mux1_out[3], mux1_out[2], mux1_out[1], mux1_out[0],
		Data_out, Immediate_out, RtAddr_out_EX, RdAddr_out_EX, WB_EX, M_EX, EX);

	ALU_Control C2(EX[5:0], EX[12:11], Funct);

	Mux_32bits mux2(Data_out[31:0], Immediate_out, EX[13], mux2_out);

	ALU A1(Data_out[63:32], mux2_out, EX[10:6], Funct, ALU_Result);

	Mux_32bits mux3(RtAddr_out_EX, RdAddr_out_EX, EX[14], mux3_out);

	EXMEM Register3(clk, WB_EX, M_EX, ALU_Result, Data_out[31:0], mux3_out[4:0], WB_MEM, M_MEM, ALU_ResultOut_MEM, MemWriteData, RdAddr_out_MEM);

	DM Data_Memory(MemReadData, MemWriteData, ALU_ResultOut_MEM[6:0], M_MEM[1], M_MEM[0], clk);

	MEMWB Register4(clk, WB_MEM, ALU_ResultOut_MEM, MemReadData, RdAddr_out_MEM, WB_WB, ALU_ResultOut_WB, MemReadData_out, RdAddr_out_WB);

	Mux_32bits mux4(ALU_ResultOut_WB, MemReadData_out, WB_WB[0], mux4_out);
endmodule
