module counterMod10 (
    input wire [3:0] CNT_in,
    input wire loadn, clrn, clk, en,
    output reg [3:0] CNT, 
    output reg tc, zero
);

always @(posedge clk) begin
        if(clrn == 0) CNT <= 0;
        else if(loadn == 0) CNT <= CNT_in; 
        else if (CNT == 0 && en == 1) CNT <= 9;
        else if (CNT > 9) CNT <= 9; 
        else if(en == 1) CNT <= CNT - 1;
        else CNT <= CNT;
end

always @(CNT or en) begin
    if((en == 1) && (CNT == 4'b0000)) begin
        tc <= 1; 
        zero <= 1;
    end
    else begin
        tc <= 0;
        zero <= 0;
    end
end

endmodule