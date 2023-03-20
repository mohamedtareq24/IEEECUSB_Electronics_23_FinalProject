module Sign_extend (
  input [31:7] Inst_25, //part of the instruction[31:7]
  input [1:0] sel,  //2-bits to specify the type of the instruction
  output reg [31:0] ImmExt
);
always@(*)
begin
  case(sel)
   2'b00 : ImmExt = {{20{Inst_25[31]}},Inst_25[31:20]} ; //I instruction
   2'b01 : ImmExt = {{20{Inst_25[31]}},Inst_25[31:25],Inst_25[11:7]} ; //S instruction
   2'b10 : ImmExt = {{20{Inst_25[31]}},Inst_25[7],Inst_25[30:25],Inst_25[11:8],1'b0} ; //B instruction
default : ImmExt = 32'hx;
  endcase
end

endmodule
