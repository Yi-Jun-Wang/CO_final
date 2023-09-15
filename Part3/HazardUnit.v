module HazardUnit(MemRead_EX, Rd_Addr_EX, RsAddr_ID, Rt_Addr_ID, PCWrite, IFID_Write);
	input MemRead_EX;
	input[4:0] Rd_Addr_EX, RsAddr_ID, Rt_Addr_ID;
	output reg PCWrite = 1;
	output IFID_Write;
	assign IFID_Write = 1;
	always@(MemRead_EX, Rd_Addr_EX, RsAddr_ID, Rt_Addr_ID) begin
		if(MemRead_EX && ((Rd_Addr_EX == RsAddr_ID) || (Rd_Addr_EX == Rt_Addr_ID))) PCWrite = 0;
		else PCWrite = 1;
	end
endmodule
