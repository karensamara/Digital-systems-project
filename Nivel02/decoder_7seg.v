module decoder_7seg(
     input wire [3:0] sec_ones, sec_tens, min,
     output reg [0:6] sec_ones_segs, sec_tens_segs, min_segs
    );

    always @(*) //ativo em nivel baixo
    begin
        case (sec_ones) 
           0 : sec_ones_segs = 7'b0000001;
            1 : sec_ones_segs = 7'b1001111;
            2 : sec_ones_segs = 7'b0010010;
            3 : sec_ones_segs = 7'b0000110;
            4 : sec_ones_segs = 7'b1001100;
            5 : sec_ones_segs = 7'b0100100;
            6 : sec_ones_segs = 7'b0100000;
            7 : sec_ones_segs = 7'b0001111;
            8 : sec_ones_segs = 7'b0000000;
            9 : sec_ones_segs = 7'b0000100;
            default : sec_ones_segs = 7'b1111111; 

        endcase
         case (sec_tens) 
            0 : sec_tens_segs = 7'b0000001;
            1 : sec_tens_segs = 7'b1001111;
            2 : sec_tens_segs = 7'b0010010;
            3 : sec_tens_segs = 7'b0000110;
            4 : sec_tens_segs = 7'b1001100;
            5 : sec_tens_segs = 7'b0100100;
            6 : sec_tens_segs = 7'b0100000;
            7 : sec_tens_segs = 7'b0001111;
            8 : sec_tens_segs = 7'b0000000;
            9 : sec_tens_segs = 7'b0000100;
            default : sec_tens_segs = 7'b1111111; 
        endcase
         case (min) 
            0 : min_segs = 7'b0000001;
            1 : min_segs = 7'b1001111;
            2 : min_segs = 7'b0010010;
            3 : min_segs = 7'b0000110;
            4 : min_segs = 7'b1001100;
            5 : min_segs = 7'b0100100;
            6 : min_segs = 7'b0100000;
            7 : min_segs = 7'b0001111;
            8 : min_segs = 7'b0000000;
            9 : min_segs = 7'b0000100;
            default : min_segs = 7'b1111111; 
        endcase
    end


    
endmodule