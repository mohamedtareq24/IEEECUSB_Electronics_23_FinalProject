module Mux2to1 (
  input [31:0] A,B,
  input sel,
  output [31:0] C
);
assign C = sel ? B : A ;
endmodule
