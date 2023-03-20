module Data_mem (
  input [31:0] Addr,
  input [31:0] Data,
  input WD,clk,
  output [31:0] Data_out
);
reg [31:0] ram [63:0];
always@(posedge clk)
begin
  if(WD)
  ram[Addr[31:2]] <= Data;
end

assign Data_out = ram[Addr[31:2]];

endmodule
