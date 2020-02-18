module MEM(p_Clock, p_Enable, p_Addr, p_In, p_Output);
    input p_Enable, p_Clock;
    input [4:0] p_Addr;
    input [15:0] p_In;
    output reg [15:0] p_Output;
    
    integer c_Index;
    
    // Os dados terao dimensao de 16 bits e
    // uma quantidade de 32 possicoes de memoria.
    parameter v_WordSize = 15, v_ArraySize = 31;
    
    // Criando uma matriz, simulando a estrutura da memoria.
    reg [v_WordSize:0] v_Mem [0:v_ArraySize];
    
    // Inicializando a memoria com zeros.
    initial
        for (c_Index = 0; c_Index <= v_ArraySize; c_Index = c_Index + 1)
            v_Mem[c_Index] = 0;
    
    always@(posedge p_Clock)
        if(p_Enable)
            v_Mem[p_Addr] = p_In;
        else
            p_Output = v_Mem[p_Addr];
    
endmodule
