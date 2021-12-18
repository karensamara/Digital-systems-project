`timescale 1ns/1ps
`include "timer.v"

module timer_tb ();

reg [0:3] CNT_in_tb;
reg loadn_tb; reg clrn_tb; reg clk_tb; reg en_tb;
wire [0:3] sec_ones_tb;
wire [0:3] sec_tens_tb;
wire [0:3] mins_tb;
wire zero_tb;

timer UUT(.CNT_in(CNT_in_tb), .loadn(loadn_tb), .clrn(clrn_tb), .clk(clk_tb), .en(en_tb), .sec_ones(sec_ones_tb), .sec_tens(sec_tens_tb), .mins(mins_tb), .zero(zero_tb));

always #5 clk_tb = ~clk_tb;

initial begin
    $dumpfile("timer_tb.vcd");
    $dumpvars(0, timer_tb);
    
    clrn_tb = 1; en_tb = 0;
    clk_tb = 0;
    loadn_tb = 0;

    CNT_in_tb = 1;
    #6
    CNT_in_tb = 2;
    #10
    CNT_in_tb = 3;
    #10
    loadn_tb = 1;
    #5
    en_tb = 1;
    #1000

    en_tb = 0; loadn_tb = 0;

    CNT_in_tb = 1;
    #6
    CNT_in_tb = 2;
    #10
    CNT_in_tb = 3;
    #10
    CNT_in_tb = 5;
    #10
    loadn_tb = 1;
    #5
    en_tb = 1;
    #1000
    clrn_tb = 0;
    #10

    $stop;
 
end
endmodule