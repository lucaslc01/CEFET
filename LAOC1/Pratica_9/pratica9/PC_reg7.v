module PC_reg7 (R, L, incr_pc, Clock, Q);
  input [15:0] R;
  input L, incr_pc, Clock;
  output reg [15:0] Q;

  initial
    Q <= 16'b0;

  always @(posedge Clock)
    if (L)
      Q <= R;
    else
      if (incr_pc)
        Q <= Q + 1'b1;

endmodule 