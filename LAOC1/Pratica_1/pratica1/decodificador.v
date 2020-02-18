// modulo responsavel por variar a saida dependendo
// da entrada p_Input
module decodificador (p_Input, p_Output);
    input [1:0] p_Input;
    output reg [7:0] p_Output;

    // o principio de um decodificador e semelhante
    // ao processo de um switch.
    always@(p_Input)
        case (p_Input)
            2'b0:  p_Output = 8'b0;   // 8'b0 e uma forma abreviada para
            2'b1:  p_Output = 8'b1;   // o valor 00000000, pois o ModelSim
            2'b10: p_Output = 8'b10;  // faz automaticamente a expansao
            2'b11: p_Output = 8'b100;
        endcase

endmodule
