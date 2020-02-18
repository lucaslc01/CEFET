// Modulo responsavel por converter notacoes, 3 bit por padrao (011 - 00001000).
module Decoder (p_Input, p_Output);
    parameter LENGTH = 3;
    
    input [LENGTH-1:0] p_Input;
    
    // 1 x 2^LENGTH - 1
    output reg [(1<<LENGTH)-1:0] p_Output;
    
    // Deslocar o bit 1, p_Input vezes
    always@(p_Input)
        p_Output <= 1 << p_Input;

endmodule