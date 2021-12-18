`timescale 1ns/1ps
`include "SRlatch.v"

module SRlatch_tb ();

reg S_tb; reg R_tb;
wire Q_tb; wire Qn_tb;

SRlatch UUT(.S(S_tb), .R(R_tb), .Q(Q_tb), .Qn(Qn_tb));

initial begin
    $dumpfile("SRlatch_tb.vcd");
    $dumpvars(0, SRlatch_tb);
    #10
    S_tb = 1; R_tb = 0;
    #10
    S_tb = 0; R_tb = 1;
    #10
    S_tb = 0; R_tb = 0;
    #10
    S_tb = 1; R_tb = 0;
    #10 
    S_tb = 1; R_tb = 1;
    #10

    $finish;


end
    
endmodule