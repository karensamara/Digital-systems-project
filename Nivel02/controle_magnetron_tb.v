`timescale 1ns/1ps
`include "controle_magnetron.v"

module controle_magnetron_tb ();

reg startn_tb; reg stopn_tb; reg clearn_tb; reg door_closed_tb; reg timer_done_tb;
wire mag_on_tb;

controle_magnetron UUT(.startn(startn_tb), .stopn(stopn_tb), .door_closed(door_closed_tb), .timer_done(timer_done_tb),
.mag_on(mag_on_tb));

initial begin
    $dumpfile("controle_magnetron_tb.vcd");
    $dumpvars(0, controle_magnetron_tb);
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
    //PRESSIONOU O BOTAO START
    stopn_tb = 1;
    startn_tb = 0;
    #5
    timer_done_tb = 1;
    #10

    $finish;


end
    
endmodule