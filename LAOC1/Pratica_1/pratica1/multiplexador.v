// modulo responsavel por selecionar uma das entradas para a saida
module multiplexador (p_A, p_B, p_C, p_D, p_Control, p_Output);
    input [1:0] p_Control;
    input [15:0] p_A, p_B, p_C, p_D;
    output reg [15:0] p_Output;

    // caso ocorra variacao de alguma entrada, automaticamente a
    // saida sera atualizada, sendo que, o valor 00 seleciona a
    // entrada p_A, o valor 01 seleciona a entrada p_B, o valor
    // 10 seleciona a entrada p_C e o valor 11 seleciona a
    // entrada p_D
    always@(p_A, p_B, p_C, p_D, p_Control)
        case (p_Control)
            2'b0:  p_Output = p_A; // 2'b0 e uma abreviacao para 00
            2'b1:  p_Output = p_B; // 2'b1 e uma abreviacao para 01
            2'b10: p_Output = p_C; // sempre ocorre uma expansao de zeros
            2'b11: p_Output = p_D;
        endcase

endmodule
