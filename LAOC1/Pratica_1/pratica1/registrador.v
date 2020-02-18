// modulo responsavel para simular o funcionamento de um
// flip-flop do tipo D.
module registrador (p_Input, p_Clock, p_WriteOn, p_Output);
    input p_Clock, p_WriteOn;
    input [15:0] p_Input;
    output reg [15:0] p_Output;

    // o valor da saida so e alterado quando a entrada p_WriteOn
    // possui o valor Um
    always@(posedge p_Clock)
        if(p_WriteOn)
            p_Output = p_Input;

endmodule
