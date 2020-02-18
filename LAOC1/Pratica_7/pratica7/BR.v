module BR (p_Clock, p_IncPC, p_EnableWrite, p_ReadAddr1, p_ReadAddr2, p_WriteAddr, p_DataIn, p_DataOut1, p_DataOut2);
    input p_EnableWrite, p_Clock, p_IncPC;
    input [2:0] p_ReadAddr1, p_ReadAddr2, p_WriteAddr;
    input [15:0] p_DataIn;
    output [15:0] p_DataOut1, p_DataOut2;
    
    wire [7:0] v_DecoderOut;
    wire [15:0] v_Register [7:0];
    
    // Conversor de notacao, auxilia no gerenciamento dos registradores (011 - 00001000).
    Decoder dec(p_WriteAddr, v_DecoderOut);
    
    // Program Counter - posicao da proxima instrucao a ser executada.
    PC pc(p_Clock, p_IncPC, v_DecoderOut[7] & p_EnableWrite, p_DataIn, v_Register[7]);
    
    // Banco de Registradores
    Register reg0(p_Clock, v_DecoderOut[0] & p_EnableWrite, p_DataIn, v_Register[0]);
    Register reg1(p_Clock, v_DecoderOut[1] & p_EnableWrite, p_DataIn, v_Register[1]);
    Register reg2(p_Clock, v_DecoderOut[2] & p_EnableWrite, p_DataIn, v_Register[2]);
    Register reg3(p_Clock, v_DecoderOut[3] & p_EnableWrite, p_DataIn, v_Register[3]);
    Register reg4(p_Clock, v_DecoderOut[4] & p_EnableWrite, p_DataIn, v_Register[4]);
    Register reg5(p_Clock, v_DecoderOut[5] & p_EnableWrite, p_DataIn, v_Register[5]);
    Register reg6(p_Clock, v_DecoderOut[6] & p_EnableWrite, p_DataIn, v_Register[6]);
    
    // Leitura sincrona (executado sempre)
    assign p_DataOut1 = v_Register[p_ReadAddr1];
    assign p_DataOut2 = v_Register[p_ReadAddr2];
      
endmodule