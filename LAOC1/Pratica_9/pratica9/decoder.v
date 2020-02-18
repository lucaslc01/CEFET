module decoder #(parameter N = 4) (input [N-1:0] DataIn, output reg [(1<<N)-1:0] DataOut);
  always @ (DataIn)
    DataOut <= 1 << DataIn;
endmodule
