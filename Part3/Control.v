module Control(
	input[5:0] OpCode,
	output[1:0] ALUOp,
	output RegWrite, MemWrite, MemRead, RegDst, ALUSrc, MemtoReg
	);
	assign ALUOp = (OpCode==6'b000100)? 2'b10: 
					(OpCode==6'b001100)||(OpCode==6'b010000)||(OpCode==6'b010001)? 2'b01:
					(OpCode==6'b001101)||(OpCode==6'b010011)||(OpCode==6'b011100)? 2'b00: 2'bx;
	assign RegWrite = (OpCode==6'b000100)||(OpCode==6'b001100)||(OpCode==6'b001101)||(OpCode==6'b010001);
	assign MemWrite = (OpCode==6'b010000);
	assign MemRead = (OpCode==6'b010001);
	assign RegDst = (OpCode==6'b000100);
	assign ALUSrc = (OpCode==6'b001100)||(OpCode==6'b001101)||(OpCode==6'b010000)||(OpCode==6'b010001);
	assign MemtoReg = (OpCode==6'b010001);
endmodule