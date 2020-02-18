module registerFile (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock, incr_pc);
  input RegWrite, clock, incr_pc;
  input [3:0] Read1,Read2,WriteReg;
  input [15:0] WriteData;
  output [15:0] Data1, Data2;
     
  wire [15:0] decOut;
  wire [15:0] register [15:0];

  decoder dec1(WriteReg, decOut);

  PC_reg7 PC(WriteData, decOut[15]& RegWrite, incr_pc, clock, register[15]);

  register16bits register1(WriteData, decOut[0]& RegWrite , clock, register[0]);
  register16bits register2(WriteData, decOut[1]& RegWrite , clock, register[1]);
  register16bits register3(WriteData, decOut[2]& RegWrite , clock, register[2]);
  register16bits register4(WriteData, decOut[3]& RegWrite , clock, register[3]);
  register16bits register5(WriteData, decOut[4]& RegWrite , clock, register[4]);
  register16bits register6(WriteData, decOut[5]& RegWrite , clock, register[5]);
  register16bits register7(WriteData, decOut[6]& RegWrite , clock, register[6]);
  register16bits register8(WriteData, decOut[7]& RegWrite , clock, register[7]);
  register16bits register9(WriteData, decOut[8]& RegWrite , clock, register[8]);
  register16bits register10(WriteData, decOut[9]& RegWrite , clock, register[9]);
  register16bits register11(WriteData, decOut[10]& RegWrite , clock, register[10]);
  register16bits register12(WriteData, decOut[11]& RegWrite , clock, register[11]);
  register16bits register13(WriteData, decOut[12]& RegWrite , clock, register[12]);
  register16bits register14(WriteData, decOut[13]& RegWrite , clock, register[13]);
  register16bits register15(WriteData, decOut[14]& RegWrite , clock, register[14]);

  assign Data1 = register[Read1];
  assign Data2 = register[Read2];

endmodule