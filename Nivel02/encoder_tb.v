`timescale 1ms/1ns
`include "encoder.v"

module encoder_tb ();

reg[9:0] keypad_tb; reg enablen_tb; reg clk_tb;
wire[3:0] D_tb; wire loadn_tb; wire pgt_1Hz_tb;

encoder UUT( .keypad(keypad_tb), .enablen(enablen_tb), .clk(clk_tb), .D(D_tb), 
 .loadn(loadn_tb), .pgt_1Hz(pgt_1Hz_tb));

always #10 clk_tb = ~clk_tb;

initial begin
    $dumpfile("encoder_tb.vcd");
    $dumpvars(0, encoder_tb);
    clk_tb = 0;
    keypad_tb = 9'b000000000;
    enablen_tb = 1;
    #20
    enablen_tb = 0;
    #10
    keypad_tb[5] = 1;
    #90
    keypad_tb[5] = 0;
    #50
    keypad_tb[1] = 1;
    #100
    keypad_tb[1] = 0;
    #100
    enablen_tb = 1;
    #1500


    $stop;
 
end
endmodule