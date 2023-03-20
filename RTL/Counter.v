module Counter(
  input clk,areset,en,
  output reg [4:0] count
);

always@(posedge clk or negedge areset)
begin
 if(!areset)
   count <= 5'b00000;
 else if(en)
   count <= count + 1'b1;
end

endmodule
