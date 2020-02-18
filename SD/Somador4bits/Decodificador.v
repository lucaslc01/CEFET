module Decodificador(e,hex);

input [3:0]e;
output reg [0:6]hex;

always@(*)
	begin
		case(e)
		    //    hex      abcdefg
		4'b0000 : hex = 7'b0000001;
		4'b0001 : hex = 7'b1001111;
		4'b0010 : hex = 7'b0010010;
		4'b0011 : hex = 7'b0000110;
		4'b0100 : hex = 7'b1001100;
		4'b0101 : hex = 7'b0100100;
		4'b0110 : hex = 7'b0100000;
		4'b0111 : hex = 7'b0001111;
		4'b1000 : hex = 7'b0000000;
		4'b1001 : hex = 7'b0000100;
		default : hex = 7'b1111111;
		endcase;
	end

endmodule
