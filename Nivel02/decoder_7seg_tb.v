`timescale 1ns/1ps
`include "decoder_7seg.v"

module decoder_7seg_tb ();

reg[0:3] sec_ones_tb; reg[0:3] sec_tens_tb; reg[0:3] min_tb;
wire [0:6] sec_ones_segs_tb; wire [0:6]  sec_tens_segs_tb; wire [0:6]  min_segs_tb;

decoder_7seg UUT(.sec_ones(sec_ones_tb), .sec_tens(sec_tens_tb), .min(min_tb), .sec_ones_segs(sec_ones_segs_tb),
.sec_tens_segs(sec_tens_segs_tb), .min_segs(min_segs_tb));

initial begin
    $dumpfile("decoder_7seg_tb.vcd");
    $dumpvars(0, decoder_7seg_tb);
    #10
    sec_ones_tb = 8; sec_tens_tb = 1; min_tb = 2;
    #2
    sec_ones_tb = 7; #2
    sec_ones_tb = 6; #2
    sec_ones_tb = 0;  sec_tens_tb = 0; #3
    sec_ones_tb = 9;  #2
    sec_ones_tb = 8;  #2
    sec_ones_tb = 1;  #2
    sec_ones_tb = 9;  sec_tens_tb = 5; min_tb = 1;#2
    $finish;


end
    
endmodule