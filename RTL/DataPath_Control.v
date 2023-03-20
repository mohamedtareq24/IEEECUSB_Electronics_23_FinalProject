module DataPath_Control(
  input SF,ZF,          
  input [6:0] OP,
  input [14:12] Funct3,
  output reg PCSrc,
  output PCLoad,       //PC control
  output ALUSrc,ResultSrc,   //Muxes control signals
  output reg [1:0] SEControl,    //Sign_Extend control
  output WD,              //DATA memory control signal
  output W                  //Regfile signal
);
localparam LW = 7'b000_0011, SW = 7'b010_0011, ALUi = 7'b001_0011, ALU = 7'b011_0011, BR = 7'b110_0011;

assign PCLoad = (OP == 7'b0) ? 0 : 1;
assign ResultSrc = (OP == LW) ? 1 : 0;
assign WD = (OP == SW) ? 1 : 0;
assign ALUSrc = ((OP == ALU)|(OP == BR)) ? 0 : 1;
assign W = ((OP == LW)|(OP == ALUi)|(OP == ALU)) ? 1 : 0;
always@(*)
begin
  PCSrc = 0;
  if(OP == BR)
  begin
    case(Funct3)
     3'b000 : if(ZF == 1)
               PCSrc = 1 ;
     3'b001 : if(ZF == 0) 
		PCSrc = 1 ;
     3'b100 : if(SF == 1)
		PCSrc = 1;
    endcase
  end
end

always@(*)
begin
  SEControl = 2'b00;
  case(OP)
   SW : SEControl = 2'b01;
   BR : SEControl = 2'b10;
  endcase
end 

endmodule
