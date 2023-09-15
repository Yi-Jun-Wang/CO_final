module ALU (
input [31:0] Src1,
input [31:0] Src2,
input [4:0] Shamt,
input [5:0] Funct,
output [31:0] Result,
output Zero,
output Carry
);
  reg[31:0] result_reg;
  reg carry_reg = 0;
  assign Carry = carry_reg;
  assign Result = result_reg;
  assign Zero = !(result_reg);
  always@(Funct, Src1, Src2, Shamt) begin
    carry_reg = 0;
    case(Funct)
      6'b001001 : {carry_reg, result_reg} = Src1 + Src2;
      6'b001010 : {carry_reg, result_reg} = Src1 - Src2;
      6'b010001 : result_reg = Src1 & Src2;
      6'b100001 : {carry_reg, result_reg} = Src1 << Shamt;
      default : result_reg = 0;
    endcase  
  end

endmodule
