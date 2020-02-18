//somador de 4 bits

module Somador4bits(x,y,te0,HEX0,HEX1);

input [3:0] x,y; //entradas
input te0;
output [0:6]HEX0,HEX1; //saidas

wire [3:0] s,ts; //variaveis intermediarias

Somador1bit BLOCO0 (x[0],y[0],te0,s[0],ts[0]); //realizando soma bit a bit chamando o Somador1bit
Somador1bit BLOCO1 (x[1],y[1],ts[0],s[1],ts[1]);
Somador1bit BLOCO2 (x[2],y[2],ts[1],s[2],ts[2]);
Somador1bit BLOCO3 (x[3],y[3],ts[2],s[3],ts[3]);

wire [4:0] resultado; //variaveis intermediarias para Decodificador 
wire [3:0] unid,dez;

assign resultado = {ts[3],s}; //concatenando ts[3] com o vetor s para ter o resultado.
assign dez = resultado/10;
assign unid = resultado%10;

Decodificador D0 (unid,HEX0);//chamando Decodificador para associar ao display
Decodificador D1 (dez,HEX1);

endmodule
