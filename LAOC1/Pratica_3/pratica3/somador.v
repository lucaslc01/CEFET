// modulo responsavel por realizar a soma ou a subtracao
// das entradas p_A e p_B, dependendo do valor de p_Controle
module somador (p_A, p_B, p_Controle, p_Output);
    input p_Controle;
    input [15:0] p_A, p_B;
    output reg [15:0] p_Output;

    // se p_Controle for igual a Zero, sera realizado
    // uma soma das entradas p_A e p_B, caso contrario,
    // sera realizado uma subtracao entre eles.
    always@(p_A, p_B, p_Controle)
        if(p_Controle)
            p_Output = p_A + p_B;
        else
            p_Output = p_A - p_B;

endmodule