// Quartus Prime Verilog Template
// Single Port ROM

module Inst_mem(
	input [31:0] addr, 
	output [31:0] inst
);

	// Declare the ROM variable
	reg [31:0] rom[63:0];

	initial
	begin
		$readmemh("rom_init.txt", rom);
	end
	assign inst = rom[addr[31:2]];

endmodule
