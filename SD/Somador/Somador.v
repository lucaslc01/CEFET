module Somador(X,Y,TE,HEX0);
input  X,Y,TE;
output [0:6] HEX0;



wire  TS,S;
assign S =((X)^(Y)^(TE));
assign  TS =((X&Y)|(X)&(TE)|(Y)&(TE));



wire [3:0]   entrada = {1'b0,1'b0, TS, S};
decodificador BLOCO1(entrada,HEX0);


endmodule 

