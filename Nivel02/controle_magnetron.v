`include "..\Nivel03\logica_controle.v"
`include "..\Nivel03\SRlatch.v"

module controle_magnetron (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output wire mag_on
);
wire S, R, magn_on;

logica_controle controle(startn, stopn, clearn, door_closed, timer_done, S, R);
SRlatch latch(S, R, mag_on, magn_on);

    
endmodule