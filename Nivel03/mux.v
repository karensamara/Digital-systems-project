module mux (
    input wire D0, D1,
    input wire Sel,
    output reg out
);

always @(*) begin
    out = (Sel == 0) ? D0 : D1;
end
    
endmodule