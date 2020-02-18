//somador de 1 bit

module Somador1bit(x,y,te0,s,ts); 

input x,y,te0;
output s,ts;

assign s = ((x)^(y)^te0);
assign ts = ((x & y)|(x & te0)|(y & te0));

endmodule
