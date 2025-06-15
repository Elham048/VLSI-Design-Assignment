module ALU_OP2 
(
    input wire [6:0] A,
    input wire [2:0] B,      // Number of bits to rotate (0–7)
    output reg [6:0] R
);
    always @(*) begin
        case (B)
            3'd0: R = A;                                             // No rotation
            3'd1: R = {A[0], A[6:1]};
            3'd2: R = {A[1:0], A[6:2]};
            3'd3: R = {A[2:0], A[6:3]};
            3'd4: R = {A[3:0], A[6:4]};
            3'd5: R = {A[4:0], A[6:5]};
            3'd6: R = {A[5:0], A[6]};
            3'd7: R = A;  // Full rotate results in original
            default: R = A;
        endcase
    end
endmodule
