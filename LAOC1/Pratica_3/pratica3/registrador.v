// modulo responsavel para simular o funcionamento de um
// flip-flop do tipo D.
module registrador (p_Input, p_Clock, p_WriteOn, p_Clear, p_Output);
    input p_Clock, p_WriteOn, p_Clear;
    input [15:0] p_Input;
    output reg [15:0] p_Output;
    
    // valor inicial do registrador
    initial
        p_Output = 16'b0;

    // caso p_Clear esteja ativo, a saida sera zerada indepente
    // do estado de p_WriteOn
    always@(posedge p_Clock, posedge p_Clear)
        if(p_Clear)
            p_Output = 16'b0;
        else if(p_WriteOn)
            p_Output = p_Input;

endmodule
