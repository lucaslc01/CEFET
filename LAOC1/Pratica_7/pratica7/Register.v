// Modulo responsavel por simular um Registrador, 16 bits por padrao.
module Register(p_Clock, p_EnableWrite, p_DataIn, p_Output);
    parameter LENGTH = 16;

    input p_Clock, p_EnableWrite;
    input [LENGTH-1:0] p_DataIn;
    output reg [LENGTH-1:0] p_Output;
    
    always@(posedge p_Clock)
        if(p_EnableWrite)
            p_Output <= p_DataIn;

endmodule