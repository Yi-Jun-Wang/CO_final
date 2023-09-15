module Mux_3to1(Input1, Input2, Input3, Output1, select);
	input[31:0] Input1, Input2, Input3;
	input[1:0] select;
	output[31:0] Output1;
	assign Output1 = (select==2'b00) ? Input1
					:(select==2'b01) ? Input2
					:(select==2'b10) ? Input3 : Input1;
endmodule
