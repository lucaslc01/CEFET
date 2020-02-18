module ULA(p_A, p_B, p_Output, p_Ctrl);
    input [1:0] p_Ctrl;
    input [15:0] p_A, p_B;
    output reg [15:0] p_Output;
    
    always@(p_Ctrl)
        case(p_Ctrl)
            2'b0: p_Output = p_A + p_B;
            2'b1: p_Output = p_A & p_B;
            2'b10: p_Output = p_A | p_B;
            2'b11: p_Output = ~p_A;
        endcase
endmodule
