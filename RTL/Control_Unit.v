module Control_Unit(
  input SF,ZF,          
  input [6:0] OP,
  input [14:12] Funct3,
  input Funct7,
  output PCSrc,PCLoad,       //PC control
  output [2:0] ALUControl,   //ALU control
  output ALUSrc,ResultSrc,   //Muxes control signals
  output [1:0] SEControl,    //Sign_Extend control
  output WD,              //DATA memory control signal
  output W                  //Regfile signal
);

DataPath_Control U1 (.SF(SF),.ZF(ZF),.OP(OP),.Funct3(Funct3),.PCSrc(PCSrc),.PCLoad(PCLoad),.ALUSrc(ALUSrc),.ResultSrc(ResultSrc),.SEControl(SEControl),.WD(WD),.W(W));
ALU_Control U2 (.OP(OP),.Funct3(Funct3),.Funct7(Funct7),.ALUControl(ALUControl));
endmodule
