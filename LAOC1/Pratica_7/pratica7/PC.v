// Modulo responsavel pelo fluxo de execucao das instrucoes
module PC(p_Clock, p_IncPC, p_Load, p_DataIn, p_Output);
    input p_Clock, p_IncPC, p_Load;
    input [15:0] p_DataIn;
    output reg [15:0] p_Output;
    
    // Inicializa o PC com o valor 0.
    initial
        p_Output <= 1'b0;
    
    // Devido a instrucoes que alteram o valor de PC, como por exemplo a Instrucao Jump (j),
    // e necessario os parametros p_Load e p_DataIn.
    always@(posedge p_Clock)
        if(p_Load)
            p_Output <= p_DataIn;
        else if(p_IncPC)
            p_Output <= p_Output + 1'b1;
            
endmodule