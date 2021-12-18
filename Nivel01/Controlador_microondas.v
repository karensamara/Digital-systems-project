`include "..\Nivel02\controle_magnetron.v"
`include "..\Nivel02\decoder_7seg.v"
`include "..\Nivel02\encoder.v"
`include "..\Nivel02\timer.v"

module Controlador_microondas (                        
    input wire startn, stopn, clearn, door_closed, clk,
    input wire[9:0] keypad,
    output wire mag_on, 
    output wire [0:6] sec_ones_segs, sec_tens_segs, min_segs
);
wire timer_done;
wire loadn, pgt_1Hz, zero;
wire[3:0] D;
wire [3:0] sec_ones; wire [3:0] sec_tens; wire [3:0] mins;

    controle_magnetron controle(startn, stopn, clearn, door_closed, timer_done, mag_on);
    encoder codificador(keypad[9:0], mag_on, clk, D[3:0], loadn, pgt_1Hz);
    timer temporizador(D[3:0], loadn, clearn, pgt_1Hz, mag_on, sec_ones[3:0], sec_tens[3:0], mins[3:0], timer_done);
    decoder_7seg decodificador(sec_ones, sec_tens, mins, sec_ones_segs, sec_tens_segs, min_segs);

    
endmodule