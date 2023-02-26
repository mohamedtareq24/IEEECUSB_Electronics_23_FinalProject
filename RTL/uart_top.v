module uart_top(
  input clk,areset_cpu,areset_uart,WD,
  input [7:0] data,
  output tx_serial
);

wire [7:0] q;

uart_tx uart (.areset(areset_uart),.clk1(clk),.data(q),.tx_serial(tx_serial));
Buffer buff (.areset(areset_cpu),.clk(clk),.load(WD),.d(data),.q(q));

endmodule
