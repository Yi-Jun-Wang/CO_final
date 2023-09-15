module IFID(clk, IFID_Write, Instr, Instr_out);
	input clk, IFID_Write;
	input [31:0] Instr;
	output reg [31:0] Instr_out = 0;
	always @(posedge clk) begin
		if(IFID_Write) Instr_out = Instr;
		else Instr_out = 32'hFFFF_FFFF;
	end
endmodule
