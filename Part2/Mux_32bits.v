module Mux_32bits(Mux_In0, Mux_In1, select, Mux_Out);
	input[31:0] Mux_In0, Mux_In1;
	input select;
	output[31:0] Mux_Out;
	assign Mux_Out = select? Mux_In1: Mux_In0;
endmodule
