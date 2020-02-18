// modulo responsavel por realizar acumulacao da multiplicao
// das entradas p_A e p_B a cada borda de subida de p_Clock
module acumulador (p_A, p_B, p_Clock, p_Clear, p_Output);
    input p_Clock, p_Clear;
    input [7:0] p_A, p_B;
    output [15:0] p_Output;

    // fios de conexao entre os modulos
    wire [15:0] v_SumToReg, v_MulToSum;

    multiplicador mult (p_A, p_B, v_MulToSum);

    // a entrada p_WriteOn foi setada como constante
    registrador regs (v_SumToReg, p_Clock, 1'b1, p_Clear, p_Output);

    // este modulo pode trabalhar com duas operacoes, soma ou
    // subtracao, nesta pratica, vai ser utilizado somente a operacao
    // soma, sendo assim, p_Controle foi setado como 1
    somador sum (v_MulToSum, p_Output, 1'b1, v_SumToReg);

endmodule
