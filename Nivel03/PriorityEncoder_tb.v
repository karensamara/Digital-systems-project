`timescale 1ms/1us
`include "PriorityEncoder.v"

module PriorityEncoder_tb();
	
	reg [9:0] inputs;
	reg enable_low;
	wire [3:0] outp;
	wire V_tb;
	
	integer en_control;
	integer control;
	
	PriorityEncoder DUT(
		.keypad(inputs),
		.enablen(enable_low),
		.D(outp),
		.V(V_tb)
	);
	
	initial
	begin
		$dumpfile("PriorityEncoder_tb.vcd");
        $dumpvars(0,PriorityEncoder_tb);
		inputs = 9'b000000000;

		enable_low = 0;
		inputs[9] = 1;
		#5
		inputs[9] = 0;
		#10
		inputs[8] = 1;
		#5
		inputs[8] = 0;
		#5
		inputs[0] = 1;
		#10
		inputs[0] = 0;
		#10
		inputs[5] = 1;
		#10
		inputs[5] = 0;
		#10
		$finish;

	end
	
endmodule