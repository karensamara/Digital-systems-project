`include "..\Nivel03\PriorityEncoder.v"
`include "..\Nivel03\nonrecycle_counter.v"
`include "..\Nivel03\clk_div.v"
`include "..\Nivel03\mux.v"

module encoder (
    input wire[9:0] keypad, input wire enablen, clk,
    output wire[3:0] D, output wire loadn, pgt_1Hz
);

wire clk_1hz;
wire delay;

PriorityEncoder codificador(keypad[9:0], enablen, D[3:0], loadn);
clk_div divisor_freq(clk, clk_1hz);
nonrecycle_counter contador(loadn, clk, delay);
mux multiplexador(delay, clk_1hz, enablen, pgt_1Hz);
    
endmodule