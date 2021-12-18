`timescale 1ns/1ps
`include "logica_controle.v"

module logica_controle_tb ();

reg startn_tb; reg stopn_tb; reg clearn_tb; reg door_closed_tb; reg timer_done_tb;
wire S_tb, R_tb;

logica_controle UUT(.startn(startn_tb), .stopn(stopn_tb), .door_closed(door_closed_tb), .timer_done(timer_done_tb),
.S(S_tb), .R(R_tb));

initial begin
    $dumpfile("logica_controle_tb.vcd");
    $dumpvars(0, logica_controle_tb);
    #10

    //PORTA FECHADA MAS NAO PRESSIONOU O BOTAO START
    startn_tb = 1; door_closed_tb = 1;
    #10
    //PRESSIONOU O BOTAO START E A PORTA FOI FECHADA ANTERIORMENTE
    startn_tb = 0;
    #10
    //SOLTOU O BOTAO START
    startn_tb = 1;
    #5
    //PRESSIONOU O BOTAO START
    startn_tb = 0;
    #5
    //ABRIU A PORTA
    door_closed_tb = 0; 
    #5
    //FECHOU A PORTA
    door_closed_tb = 1;
    #5
    //PRESSIONOU O BOTAO START
    startn_tb = 0;
    #5
    //PRESSIONOU O BOTAO STOP
    stopn_tb = 0;
    #5

    $finish;


end
    
endmodule