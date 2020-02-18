module Decodificador(e,s);
input [3:0]e;
output reg [0:6]s;

always@(*)
	begin
		case(e)
		4'b0000 : s = 7'b0000001;
		4'b0001 : s = 7'b1001111;
		4'b0010 : s = 7'b0010010;
		4'b0011 : s = 7'b0000110;
		4'b0100 : s = 7'b1001100;
		4'b0101 : s = 7'b0100100;
		4'b0110 : s = 7'b0100000;
		4'b0111 : s = 7'b0001111;
		4'b1000 : s = 7'b0000000;
		4'b1001 : s = 7'b0000100;
		default : s = 7'b1111111;
		endcase;
	end
endmodule
