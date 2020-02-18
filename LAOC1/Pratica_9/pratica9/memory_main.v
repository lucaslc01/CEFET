module memory_main (addr, data, wr_en, Clock, q);
  input [4:0] addr; 
  input [15:0] data;
  input wr_en, Clock;
  output [15:0] q;

  reg [15:0] Mem [0:31];

  initial begin
//    Mem[ 5'h0] = 16'hf000;
//    Mem[ 5'h1] = 16'hfff0;
//    Mem[ 5'h2] = 16'hf800;
//    Mem[ 5'h3] = 16'h0008;
//    Mem[ 5'h4] = 16'hed00;
//    Mem[ 5'h5] = 16'h3200;
//    Mem[ 5'h6] = 16'h0a08;

    // Copy Input
    Mem[ 5'h0 ] = 16'hf000;
    Mem[ 5'h1 ] = 16'h001a;
    Mem[ 5'h2 ] = 16'hf100;
    Mem[ 5'h3 ] = 16'h000f;

    // Not
//    Mem[ 5'h4 ] = 16'h0020;

    // And
//    Mem[ 5'h4 ] = 16'h1012;

    // Or
//    Mem[ 5'h4 ] = 16'h2012;

    // Add
//    Mem[ 5'h4 ] = 16'h3012;

    // Copy
//    Mem[ 5'h4 ] = 16'he020;
    
    // Conditional Copy
//    Mem[ 5'h0 ] = 16'hf000;
//    Mem[ 5'h1 ] = 16'hffff;

//    Mem[ 5'h2 ] = 16'hf100;
//    Mem[ 5'h3 ] = 16'h0123;

//    Mem[ 5'h4 ] = 16'h0020;
//    Mem[ 5'h5 ] = 16'hb020;

//    Mem[ 5'h6 ] = 16'h0130;
//    Mem[ 5'h7 ] = 16'hb130;
    
    // Load
//    Mem[ 5'h4 ] = 16'hc020;
//    Mem[ 5'b11010 ] = 16'h0123;

    // Store
//    Mem[ 5'h4 ] = 16'hd010;
  end

  assign q = Mem[addr];

  always @(posedge Clock)
    if (wr_en)
      Mem[addr] = data;

endmodule

