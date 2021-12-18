module clk_div 
#( 
parameter WIDTH = 6, 
parameter N = 50
)
(input wire clk, output wire clk_out);
 
reg [WIDTH-1:0] r_reg;
wire [WIDTH-1:0] r_nxt;
reg clk_track;

initial r_reg = 0;
initial clk_track = 1'b0;
 
always @(posedge clk)
 begin
    if (r_nxt == N)
 	   begin
	     r_reg <= 0;
	     clk_track <= ~clk_track;
	   end  
    else begin
      r_reg <= r_nxt;
    end
end
 
 assign r_nxt = r_reg+1;   	      
 assign clk_out = clk_track;
endmodule