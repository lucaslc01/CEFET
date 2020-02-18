module porta_exor (Y,A,B);

//definicao da saida Y e das entradas A e B
output reg Y;
input A,B;

//funcionalidade do circuito

always@ (A or B)
	begin
		case ({A,B}) //concatenacao
			2'b00 : Y = 1'b0;
			2'b01 : Y = 1'b1;
			2'b10 : Y = 1'b1;
			2'b11 : Y = 1'b0;
		endcase;
	end
endmodule