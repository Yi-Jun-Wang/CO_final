module IFID(clk, Instr, Instr_out);
	input clk;
	input [31:0] Instr;
	output reg [31:0] Instr_out;
	always @(posedge clk) begin
		Instr_out = Instr;
	end
endmodule
