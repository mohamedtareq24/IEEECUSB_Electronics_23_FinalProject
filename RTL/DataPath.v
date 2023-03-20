module DataPath(
  input areset,clk,
  input PCSrc,PCLoad,       //PC control
  input [2:0] ALUControl,   //ALU control
  input ALUSrc,ResultSrc,   //Muxes control signals
  input [1:0] SEControl,    //Sign_Extend control
  input WD,              //DATA memory control signal
  input W,                  //Regfile signal
  output SF,ZF,          
  output [6:0] OP,
  output [14:12] Funct3,
  output Funct7,
  output [31:0] out
);
wire [31:0] PCReg,ImmExt,Inst,RD1,RD2,WB,SrcB,ALUResult,DataMem;

PC pc (.areset(areset),.PCSrc(PCSrc),.clk(clk),.load(PCLoad),.ImmExt(ImmExt),.PC(PCReg));
Inst_mem inst_mem (.addr(PCReg),.inst(Inst));
Register_File regfile (.RReg1(Inst[19:15]),.RReg2(Inst[24:20]),.WReg(Inst[11:7]),.W(W),.clk(clk),.areset(areset),.data(WB),.RD1(RD1),.RD2(RD2));
Sign_extend signextend (.Inst_25(Inst[31:7]),.sel(SEControl),.ImmExt(ImmExt));
Mux2to1 mux1 (.A(RD2),.B(ImmExt),.sel(ALUSrc),.C(SrcB));
ALU alu (.A(RD1),.B(SrcB),.sel(ALUControl),.C(ALUResult),.ZF(ZF),.SF(SF));
Data_mem data_mem (.Addr(ALUResult),.Data(RD2),.WD(WD),.clk(clk),.Data_out(DataMem));
Mux2to1 mux2 (.A(ALUResult),.B(DataMem),.sel(ResultSrc),.C(WB));

assign OP = Inst[6:0];
assign Funct3 = Inst[14:12];
assign Funct7 = Inst[30];
assign out = RD2;
endmodule
