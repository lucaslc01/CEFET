module mux4_1_16bits (A, B, C, D, Control, DataOut);
  input [15:0] A, B, C, D;
  input [1:0] Control;
  output reg [15:0] DataOut;

  always @(A, B, C, D, Control)
    case (Control)
      2'b00: DataOut <= A;
      2'b01: DataOut <= B;
      2'b10: DataOut <= C;
      2'b11: DataOut <= D;
    endcase
endmodule