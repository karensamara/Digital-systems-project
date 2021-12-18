 `include "clk_div.v"
 `timescale 1ms/1ns

 module clk_div_tb();
  reg clk_tb;
  wire clk_out_tb;
 
     clk_div UUT(.clk(clk_tb), .clk_out(clk_out_tb));
        initial
          clk_tb= 1'b0;
     always
        #10  clk_tb=~clk_tb; 
        initial
            begin
               #10000 $finish;
            end
 
        initial
            begin
              $dumpfile("clk_div_tb.vcd");
              $dumpvars(0,clk_div_tb);
             end
    endmodule