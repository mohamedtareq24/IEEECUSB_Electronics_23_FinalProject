module PC (
 input areset,PCSrc,clk,load,
 input [31:0] ImmExt,
 output reg [31:0] PC
);
reg [31:0] PCNext;

always@(*)
begin
 if(PCSrc)
  PCNext = ImmExt + PC;
 else
  PCNext = PC + 3'b100;
end

always@(posedge clk,negedge areset)
begin
  if(!areset)
    PC <= 32'h0000_0000;
  else if(load)
    PC <= PCNext;
end

endmodule
