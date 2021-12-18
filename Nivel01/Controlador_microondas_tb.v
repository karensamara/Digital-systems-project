`timescale 1ns/1ps
`include "Controlador_microondas.v"

module Controlador_microondas_tb ();
                                                                         //
reg startn_tb; reg stopn_tb; reg clearn_tb; reg door_closed_tb; reg clk_tb;
reg[9:0] keypad_tb;
wire [0:6] sec_ones_segs_tb; wire [0:6] sec_tens_segs_tb; wire [0:6] min_segs_tb;
wire mag_on_tb;
                                                                                                        //
Controlador_microondas UUT(.startn(startn_tb), .stopn(stopn_tb), .door_closed(door_closed_tb), .clearn(clearn_tb),
.clk(clk_tb), .mag_on(mag_on_tb), .keypad(keypad_tb), .sec_ones_segs(sec_ones_segs_tb),
.sec_tens_segs(sec_tens_segs_tb), .min_segs(min_segs_tb));

always #10 clk_tb = ~clk_tb;

initial begin
    $dumpfile("Controlador_microondas_tb.vcd");
    $dumpvars(0, Controlador_microondas_tb);
    #5
    //INICIALIZAÇÃO
    clk_tb = 0; startn_tb = 1; door_closed_tb = 1; clearn_tb = 1; stopn_tb = 1;
    keypad_tb = 9'b000000000;

    #5
    //PORTA ABERTA E DIGITANDO COLOCANDO O TIMER PARA 1:48
    door_closed_tb = 0;
    keypad_tb[1] = 1;
    #90
    keypad_tb[1] = 0;
    #5
    keypad_tb[4] = 1;
    #90
    keypad_tb[4] = 0;
    #5
    keypad_tb[8] = 1;
    #90
    keypad_tb[8] = 0;
    #5
    //PORTA FECHADA E PRESSIONANDO O BOTAO START
    startn_tb = 0; door_closed_tb = 1;
    #100
    startn_tb = 1;
    #150000
    //PRESSIONANDO O BOTAO STOP E DEPOIS DANDO START NOVAMENTE obs: timer_done vai pra 1 e o microondas vai parar
    stopn_tb = 0;
    #100
    stopn_tb = 1;
    #100000
    startn_tb = 0;
    #100
    startn_tb  = 1;
    #100000
    //ABRINDO A PORTA E COLOCANDO O TIMER PARA 2:50
    door_closed_tb = 0;
    keypad_tb[2] = 1;
    #90
    keypad_tb[2] = 0;
    #5
    keypad_tb[5] = 1;
    #90
    keypad_tb[5] = 0;
    #5
    keypad_tb[0] = 1;
    #90
    keypad_tb[0] = 0;
    #5
    //PRESSIONANDO O BOTAO START E DEPOIS DE UM TEMPO O BOTAO CLEAR
    startn_tb = 0; door_closed_tb = 1;
    #100
    startn_tb = 1;
    #150000
    clearn_tb = 0;
    #100
    clearn_tb = 1;
    #50000

    //ABRINDO A PORTA E COLOCANDO O TIMER PARA 2:75 (?)
    door_closed_tb = 0;
    keypad_tb[2] = 1;
    #90
    keypad_tb[2] = 0;
    #5
    keypad_tb[7] = 1;
    #90
    keypad_tb[7] = 0;
    #5
    keypad_tb[5] = 1;
    #90
    keypad_tb[5] = 0;
    #5
    //PORTA FECHADA E PRESSIONANDO O BOTAO START
    startn_tb = 0; door_closed_tb = 1;
    #100
    startn_tb = 1;
    #150000
    //ABRINDO A PORTA E DEPOIS FECHANDO NOVAMENTE
    door_closed_tb = 0;
    #25000
    door_closed_tb = 1;
    #100000
   
    $finish;


end
    
endmodule
