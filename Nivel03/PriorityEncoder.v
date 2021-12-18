
module PriorityEncoder(
  input wire [9:0] keypad,
  input wire enablen,
  output reg [3:0] D,
  output reg V
);
  
  always @ (*)
  begin
	if(enablen) begin
		D = 0; V = 1;
	end else begin
		D = (keypad[9]) ? (9) :
			 (keypad[8]) ? (8) :
			 (keypad[7]) ? (7) :
			 (keypad[6]) ? (6) :
			 (keypad[5]) ? (5) :
			 (keypad[4]) ? (4) :
			 (keypad[3]) ? (3) :
			 (keypad[2]) ? (2) :
			 (keypad[1]) ? (1) :
			 (keypad[0]) ? (0) : 4'bxxxx;
		V = (keypad[9]) ? 0 :
			 (keypad[8]) ? 0 :
			 (keypad[7]) ? 0 :
			 (keypad[6]) ? 0 :
			 (keypad[5]) ? 0 :
			 (keypad[4]) ? 0 :
			 (keypad[3]) ? 0 :
			 (keypad[2]) ? 0 :
			 (keypad[1]) ? 0 :
			 (keypad[0]) ? 0 : 1;
   end
  end
  
  
endmodule