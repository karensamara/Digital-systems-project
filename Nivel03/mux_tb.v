`include "mux.v"
`timescale 1ns/1ps

module mux_tb ();

reg D0_tb; reg D1_tb; reg Sel_tb;
wire out_tb;

mux UUT(.D0(D0_tb), .D1(D1_tb), .Sel(Sel_tb), .out(out_tb));

initial begin
    $dumpfile("mux_tb.vcd");
    $dumpvars(0, mux_tb);

    D0_tb = 0; D1_tb = 1; #10
    Sel_tb = 0; #20
    D0_tb = 1; D1_tb =0; #5
    D0_tb = 0; D1_tb =1; #5
    D0_tb = 1; D1_tb =0; #5
    D0_tb = 0; D1_tb =1; #5
    Sel_tb = 1; #20
    $finish;

end
    
endmodule