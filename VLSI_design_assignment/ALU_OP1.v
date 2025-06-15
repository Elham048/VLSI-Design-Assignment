module ALU_OP1
(
    input wire [6:0] A,
    output wire [6:0] R
);
    assign R = ~A;
endmodule
