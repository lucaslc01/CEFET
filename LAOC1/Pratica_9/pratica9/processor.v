module processor (DataIn, Reset, Clock, Dout, Daddress, W);
  input [15:0] DataIn;
  input Reset, Clock; 
  output [15:0] Dout, Daddress;
  output reg W;

  wire [15:0] instruction, dataRFOut1, dataRFOut2, aluOut, DataOutMux, DataOutRegAlu;

  reg writeEnableRegALU,  writeEnableRegisterFile, incr_pc;
  reg writeEnableRegInstruction, writeEnableRegAddress, writeEnableRegDout;
  reg [1:0] Step, controlMux, controlAlu;
  reg [3:0] ReadAddressRF1, ReadAddressRF2, WriteReg;


  registerFile rf(ReadAddressRF1, ReadAddressRF2, WriteReg, DataOutMux, writeEnableRegisterFile, dataRFOut1, dataRFOut2, Clock, incr_pc);


  mux4_1_16bits mux1(dataRFOut2, dataRFOut1, DataIn, DataOutRegAlu, controlMux, DataOutMux);

  alu alu1(dataRFOut1, dataRFOut2, controlAlu, aluOut);

  register16bits regALU(aluOut, writeEnableRegALU, Clock, DataOutRegAlu);
  register16bits RegInstruction(DataIn, writeEnableRegInstruction, Clock, instruction);
  register16bits RegDout(DataOutMux, writeEnableRegDout, Clock, Dout);
  register16bits_i RegAddress(DataOutMux, writeEnableRegAddress, Clock, Daddress);


//Maquina de Estados

    
always @(posedge Clock)
begin
  if(Reset)
    Step <= 2'b0;
    
  else
    case(Step)
      2'b00:
      begin
        Step <= 2'b01;
      end
      2'b01:
      begin
        Step <= 2'b10;
      end
      2'b10:
      begin
        Step <= 2'b11;
      end
      2'b11:
        Step <= 2'b0;
        
    endcase // Step
end // always @(posedge Clock)


always @(Step, instruction)
begin
case(Step)
  2'b00:
  begin
    writeEnableRegInstruction <= 1'b1;
    writeEnableRegisterFile <= 1'b0;
    incr_pc  <= 1'b1;
    ReadAddressRF1 <= instruction[7:4];
    ReadAddressRF2 <= instruction[3:0];
    writeEnableRegAddress <= 1'b0;
    controlMux <= 2'b10;
    W <= 1'b0;

  end // Step 00 
    
  2'b01: // PASSO 1 ///////////////////////////////////////
  begin
    
  case(instruction[15:12])

    4'b1100:  // load
    begin
      incr_pc  <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      writeEnableRegAddress <= 1'b1;
      controlMux <= 2'b01;  // Endereco de qual registrador em que esta' o endereco da memoria (00 ou 01)
      ReadAddressRF1 <= instruction[11:8];
      ReadAddressRF2 <= instruction[3:0];    

    end     
    4'b1101:  // store
    begin
      incr_pc  <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      ReadAddressRF1 <= instruction[11:8];
      ReadAddressRF2 <= instruction[7:4];      

      writeEnableRegAddress <= 1'b1;
      controlMux <= 2'b01;  // seleciona o endereco da memoria onde o dado sera escrito  (00 ou 01)
      writeEnableRegDout <= 1'b0;

     
    end     
    4'b1011:  // conditional copy
    begin
      incr_pc  <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      ReadAddressRF1 <= instruction[7:4];
      ReadAddressRF2 <= instruction[11:8];

    end

    
    4'b1111:  // copy input
    begin
      incr_pc  <= 1'b1;
      writeEnableRegInstruction <= 1'b0; 
      controlMux <= 2'b0;
      ReadAddressRF2 <= 4'b1111;
      writeEnableRegAddress <= 1'b1;
      ReadAddressRF1 <= instruction[11:8];

    end     

    4'b1110:  // copy
    begin
      incr_pc  <= 1'b0;
      writeEnableRegInstruction <= 1'b0;
      ReadAddressRF1 <= instruction[11:8];     

    end

    4'b0011: // sum
    begin
      incr_pc <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      writeEnableRegisterFile <= 1'b0;
      writeEnableRegALU <= 1'b1;
      controlAlu <= 2'b00;
      controlMux <= 2'b11;
      ReadAddressRF1 <= instruction[7:4];
      ReadAddressRF2 <= instruction[11:8];

    end 
    
    4'b0010: // OR
    begin
      incr_pc <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      writeEnableRegisterFile <= 1'b0;
      writeEnableRegALU <= 1'b1;
      controlAlu <= 2'b01;
      controlMux <= 2'b11;
      ReadAddressRF1 <= instruction[7:4];
      ReadAddressRF2 <= instruction[11:8];

    end 
    
    4'b0001: //AND
    begin
      incr_pc <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      writeEnableRegisterFile <= 1'b0;
      writeEnableRegALU <= 1'b1;
      controlAlu <= 2'b10;
      controlMux <= 2'b11;
      ReadAddressRF1 <= instruction[7:4];
      ReadAddressRF2 <= instruction[11:8];
 
    end 
    
    4'b0000: // NOT
    begin
      incr_pc  <= 1'b0;
      writeEnableRegInstruction <= 1'b0;  
      writeEnableRegisterFile <= 1'b0;
      writeEnableRegALU <= 1'b1;
      controlAlu <= 2'b11;
      controlMux <= 2'b11;
      ReadAddressRF1 <= instruction[11:8];
      ReadAddressRF2 <= instruction[3:0];

    end 
  endcase     
  end 

  2'b10: // PASSO 2 ///////////////////////////////////
  begin
  casex(instruction[15:12])
    
    4'b1100:  // load
    begin
      writeEnableRegAddress <= 1'b0;
      writeEnableRegisterFile <= 1'b1;
      WriteReg <= instruction[7:4];
      controlMux <= 2'b10; // selecionar o DIN
      
    end     
    4'b1101:  // store
    begin
 
//      writeEnableRegAddress <= 1'b1;
//      controlMux <= 2'b00;  // seleciona o endereco da memoria onde o dado sera escrito  (00 ou 01)
//      writeEnableRegDout <= 1'b0;

      writeEnableRegDout <= 1'b1;
      controlMux <= 2'b00;  //  seleciona o dado que sera escrito na memoria  (00 ou 01)
      writeEnableRegAddress <= 1'b0;

    end     
    4'b1011:  // conditional copy
    begin
      if(DataOutRegAlu != 16'b0)
        begin
          incr_pc  <= 1'b0;
          writeEnableRegInstruction <= 1'b0;  
        end
      else
        begin
          writeEnableRegisterFile <= 1'b1;
          WriteReg <= instruction[7:4];
          controlMux <= 2'b00;
        end
    end     
      

    4'b001x: // ADD, OR
    begin
      writeEnableRegisterFile <= 1'b1;
      WriteReg <= instruction[3:0];
      writeEnableRegALU <= 1'b0;
      controlMux <= 2'b11;
    end
    
    4'b0001: // AND
    begin
      writeEnableRegisterFile <= 1'b1;
      WriteReg <= instruction[3:0];
      writeEnableRegALU <= 1'b0;
      controlMux <= 2'b11;
    end
    
    4'b0000: // NOT
    begin
      writeEnableRegisterFile <= 1'b1;
      WriteReg <= instruction[7:4];
      writeEnableRegALU <= 1'b0;
      controlMux <= 2'b11;
    end
  
    4'b1111:  // copy input
    begin
      writeEnableRegisterFile <= 1'b1;
      WriteReg <= instruction[11:8];
      controlMux <= 2'b10;
      incr_pc  <= 1'b0;
      writeEnableRegAddress <= 1'b0;
    end     

    4'b1110:  // copy
    begin
      writeEnableRegisterFile <= 1'b1;
      WriteReg <= instruction[7:4];
      controlMux <= 2'b01;
    end
    
    
 
  endcase
  end

  2'b11: // PASSO 3 //////////////////////////////////////////////////
  begin
    incr_pc  <= 1'b0;
    controlMux <= 2'b0;
    ReadAddressRF2 <= 4'b1111;
    writeEnableRegAddress <= 1'b1;
    writeEnableRegDout <= 1'b0;
    writeEnableRegisterFile <= 1'b0;
    if(instruction[15:12]==4'b1101) //store
    begin
      W <= 1'b1;
    end

  end
    
endcase
end


endmodule
