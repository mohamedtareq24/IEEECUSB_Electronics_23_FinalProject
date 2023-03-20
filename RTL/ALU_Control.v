module ALU_Control(       
  input [6:0] OP,
  input [14:12] Funct3,
  input Funct7,
  output reg [2:0] ALUControl   //ALU control
);
localparam LW = 7'b000_0011, SW = 7'b010_0011, ALUi = 7'b001_0011, ALU = 7'b011_0011, BR = 7'b110_0011;

always@(*)
begin
  ALUControl = 3'b000;
  if((OP==ALUi)|(OP==ALU))
  begin
   case(Funct3)
     3'b000 :begin
		if(Funct7==0)
		  ALUControl = 3'b000;
		else
         	  ALUControl = 3'b011;
             end
     default : ALUControl = Funct3;
   endcase
  end
  else if(OP==BR)
    ALUControl = 3'b011;
end

endmodule

