module ALU(
  input [31:0] A,B,
  input [2:0] sel,
  output [31:0] C,
  output ZF,SF
);
reg [32:0] R;
always@(*)
begin
  case(sel)
   3'b000 : R = A + B ;
   3'b001 : R = A<<B ;
   3'b010 : R = B ;
   3'b011 : R = A - B ;
   3'b100 : R = A ^ B ;
   3'b101 : R = A>>B ;
   3'b110 : R = A | B ;
   3'b111 : R = A & B ;
   default : R = 32'b0 ;
  endcase  
end
assign C = R[31:0] ;
assign ZF = ~(|R);
assign SF =  R[32];

endmodule
