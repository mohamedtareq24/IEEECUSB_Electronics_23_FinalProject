module Register_File (
  input [4:0] RReg1,RReg2,WReg,
  input W,clk,areset,
  input [31:0] data,
  output [31:0] RD1,RD2
);
reg [31:0] reg_file [31:0];

always@(posedge clk or negedge areset)
begin
  if(!areset)
   reg_file[0] <= 32'b0;
  else if(W)
  reg_file[WReg] <= data;
end 

assign RD1 = reg_file[RReg1] ;
assign RD2 = reg_file[RReg2] ;

endmodule
