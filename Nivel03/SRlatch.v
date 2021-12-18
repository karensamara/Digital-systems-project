module SRlatch (
    input wire S, R,
    output wire Q, Qn
);

wire Q_int, Qn_int;

assign Q_int = ~(R || Qn_int);
assign Qn_int = ~(S || Q_int);
assign Q = Q_int;
assign Qn = Qn_int;
    
endmodule