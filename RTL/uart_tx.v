module uart_tx (
  input areset,clk1,
  input [7:0] data,
  //output en_flag,
  output reg tx_serial
);
parameter Start_bit = 1'b0, End_bit = 1'b1;
reg [3:0] counter1;

 always@(*)
 begin
    case(counter1)
      0 : tx_serial = End_bit;
      1 : tx_serial = Start_bit;
      default : tx_serial = data[counter1 - 2];
    endcase 
 end
 
 always@(posedge clk1 or negedge areset)
   begin 
 if(~areset)
       counter1 <= 4'b0000;
   
    else if (counter1 == 4'b1001)
     counter1 <= 4'b0000;
  else
       counter1 <= counter1 + 1'b1;
   end
 //assign en_flag = (counter1 == 4'b1001);

endmodule

