`include "..\Nivel03\counterMod10.v"
`include "..\Nivel03\counterMod6.v"

module timer (
    input wire [3:0] CNT_in,
    input wire loadn, clrn, clk, en,
    output wire [3:0] sec_ones, output wire [3:0] sec_tens, output wire [3:0] mins,
    output wire zero
);

wire tc1, tc2, tc3, zero1, zero2, zero3;

counterMod10 segundos(CNT_in[3:0], loadn, clrn, clk, en, sec_ones[3:0], tc1, zero1);
counterMod6 segundos_decimais(sec_ones[3:0], loadn, clrn, clk, tc1, sec_tens[3:0], tc2, zero2);
counterMod10 minutos(sec_tens[3:0], loadn, clrn, clk, tc2, mins[3:0], tc3, zero3);

assign zero = zero1 && zero2 && zero3;

endmodule