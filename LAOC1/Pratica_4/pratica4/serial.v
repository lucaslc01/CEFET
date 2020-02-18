// This is an example of a serial adder.
module serial(A, B, start, resetn, clock, sum);
    input [7:0] A, B;
    input resetn, start, clock;
    output [8:0] sum;

    // Registers
    wire [7:0] A_reg,B_reg;
    wire [8:0] sum_reg;
    reg        cin;

    // Wires
    wire reset, enable, load;
    wire bit_sum, bit_carry;

    // Control FSM
    FSM my_control(start, clock, resetn, reset, enable, load);

    // Datapath
    shift_reg reg_A( clock, 1'b0, A, 1'b0, enable, load, A_reg);
    shift_reg reg_B( clock, 1'b0, B, 1'b0, enable, load, B_reg);

    // a full adder
    assign {bit_carry, bit_sum} = A_reg[0] + B_reg[0] + cin;

    always @(posedge clock)
        if (enable)
            if (reset)
                cin <= 1'b0;
        else
            cin <= bit_carry;

    shift_reg reg_sum( clock, reset, 9'd0, bit_sum, enable, 1'b0, sum);
    defparam reg_sum.n = 9;
endmodule
