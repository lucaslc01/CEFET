// modulo responsavel por realizar a multiplicacao das
// entradas p_A e p_B
module multiplicador (p_A, p_B, p_Output);
    input [7:0] p_A, p_B;
    output reg [15:0] p_Output;

    // a multilicacao so sera realizada novamente, se o
    // estado das entradas mudar
    always@(p_A, p_B)
        p_Output = p_A * p_B;

endmodule
