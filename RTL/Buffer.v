module Buffer(
  input areset,clk,load,
  input [7:0] d,
  output reg [7:0] q
);

always@(posedge clk or negedge areset)
begin
  if(!areset)
   q <= 8'h00;
  else if(load)
   q <= d;
end

endmodule
