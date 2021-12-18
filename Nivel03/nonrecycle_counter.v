module nonrecycle_counter (
    input wire clr, clk,
    output reg out
);
reg[2:0] count;
    always @(posedge clk or clr) begin
        if(clr == 1) begin count <= 0; out <= 0; end
        else if (count == 7) count <= 7;
        else count <= count+1;
        if(count == 4) out <= 1;
    end
endmodule