`timescale 1ns/1ps
`include "counterMod6.v"

module counterMod6_tb ();

reg [0:3] CNT_in_tb;
reg loadn_tb; reg clrn_tb; reg clk_tb; reg en_tb;
wire [0:3] CNT_tb;
wire tc_tb; wire zero_tb;

counterMod6 UUT(.CNT_in(CNT_in_tb), .loadn(loadn_tb), .clrn(clrn_tb), .clk(clk_tb), .en(en_tb), .CNT(CNT_tb), .tc(tc_tb), .zero(zero_tb));

always #5 clk_tb = ~clk_tb;

initial begin
    $dumpfile("counterMod6_tb.vcd");
    $dumpvars(0, counterMod6_tb);

    clk_tb = 0;
    clrn_tb = 1; en_tb = 0;
    loadn_tb = 0; CNT_in_tb = 4'b0111;
    
    #12
    loadn_tb = 1;
    #5
    en_tb = 1;
    #40
    CNT_in_tb = 4'b1010;
    loadn_tb = 0;
    #10
    loadn_tb = 1;
    #20
    en_tb = 0;
    #20
    $stop;
 
end
endmodule
    
