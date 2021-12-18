module logica_controle (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output reg S, R
);

always @(*) begin
    if(clearn == 0) begin #1000 S <= 0; #1000 R <= 1; end //tempo de espera para o timer zerar
    if((stopn == 0) || (timer_done == 1) || (door_closed == 0)) begin
        S <= 0; R <= 1;
    end
    else if(startn == 0 && door_closed)begin
        S <= 1; R <= 0;
    end 
end
    
endmodule