module ALU_Control(
		input[5:0] funct,
		input[1:0] ALUOp,
		output reg[5:0] Funct
	);
	always@(funct, ALUOp)begin
		if(ALUOp == 2'b10)begin
			case(funct)
			6'b001011: Funct = 6'b001001;
			6'b001101: Funct = 6'b001010;
			6'b010010: Funct = 6'b010001;
			6'b100110: Funct = 6'b100001;
			default: Funct = 6'bx;
			endcase
		end
		else if (ALUOp == 2'b01) Funct = 6'b001001;
		else if (ALUOp == 2'b00) Funct = 6'b001010;	
	end	
endmodule
