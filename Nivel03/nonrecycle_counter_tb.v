`timescale 1ms/1ns
`include "nonrecycle_counter.v"

module nonrecycle_counter_tb ();

reg clr_tb; reg clk_tb;
wire out_tb;

nonrecycle_counter UUT( .clr(clr_tb), .clk(clk_tb), .out(out_tb));

always #10 clk_tb = ~clk_tb;

initial begin
    $dumpfile("nonrecycle_counter_tb.vcd");
    $dumpvars(0, nonrecycle_counter_tb);
    
    clr_tb = 1;
    clk_tb = 0;

    #50
    clr_tb = 0;
    #200
    clr_tb = 1;
    #30

    $stop;
    /*
    loadn_tb = 0; CNT_in_tb = 4'b0011;
    
    #12
    loadn_tb = 1;
    en_tb = 1;
    #50
    CNT_in_tb = 4'b1010;
    loadn_tb = 0;
    #10
    loadn_tb = 1;
    #20
    en_tb = 0;
    #20
    $stop;*/
 
end
endmodule