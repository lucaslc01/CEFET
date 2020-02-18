module contador_sincrono(CLOCK_50,SW,HEX0,HEX1);


input CLOCK_50;
input [1:0]SW;
reg [3:0]q;
output [0:6]HEX0,HEX1;
wire novo_clock;
wire [3:0] dezena,unidade;

divisor d (CLOCK_50,novo_clock,SW[0],SW[1]);

always@ (posedge novo_clock or posedge SW[0] or posedge SW[1])
	begin
		if(SW[0] == 1'b1)
		begin
		q = 4'b0000;
		end
		
		else if(SW[1] == 1'b1)
		begin
		q = 4'b1111;
		end
		
		else 
		begin
		q = q + 1;
		end
	end

assign dezena = q/10;
assign unidade = q%10;

Decodificador d1(dezena,HEX1);
Decodificador d2(unidade,HEX0);
endmodule

