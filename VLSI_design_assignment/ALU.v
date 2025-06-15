module ALU
(
    input wire [6:0] A, B,
    input wire [1:0] OP,         // 00 = NOT, 01 = ROR
    output reg [6:0] R,
    output wire CF,
    output wire SF,
    output wire ZF
);

    wire [6:0] R_NOT, R_ROR;

    // Submodules
    ALU_OP1 NOT1 (.A(A), .R(R_NOT));
    ALU_OP2 ROR1 (.A(A), .B(B[2:0]), .R(R_ROR));

    always @(*) begin
        case (OP)
            2'b00: R = R_NOT;
            2'b01: R = R_ROR;
            default: R = 7'b0000000;
        endcase
    end

    assign CF = (OP == 2'b01) ? A[B % 7] : 1'b0; // CF is last bit rotated out
    assign SF = R[6];                           // Sign flag (MSB)
    assign ZF = ~(|R);                          // Zero flag
endmodule
