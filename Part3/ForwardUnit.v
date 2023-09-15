module ForwardUnit(RdAddr_MEM, RdAddr_WB, RsAddr_EX, RtAddr_EX, RegWrite_MEM, RegWrite_WB, ForwardA, ForwardB);
	input[4:0] RdAddr_MEM, RdAddr_WB, RsAddr_EX, RtAddr_EX;
	input RegWrite_MEM, RegWrite_WB;
	output reg[1:0] ForwardA = 2'b00, ForwardB = 2'b00;
	always@(RegWrite_MEM, RdAddr_MEM, RegWrite_WB, RdAddr_WB, RsAddr_EX, RtAddr_EX) begin
		if(RegWrite_MEM && (RdAddr_MEM != 0) && (RdAddr_MEM == RsAddr_EX)) begin ForwardA = 2'b10; end
		else if (RegWrite_WB && (RdAddr_WB != 0) && (RdAddr_WB == RsAddr_EX)) begin ForwardA = 2'b01; end
		else begin ForwardA = 2'b00; end

		if(RegWrite_MEM && (RdAddr_MEM != 0) && (RdAddr_MEM == RtAddr_EX)) begin ForwardB = 2'b10; end
		else if (RegWrite_WB && (RdAddr_WB != 0) && (RdAddr_WB == RtAddr_EX)) begin ForwardB = 2'b01; end
		else begin ForwardB = 2'b00; end			
	end
endmodule
