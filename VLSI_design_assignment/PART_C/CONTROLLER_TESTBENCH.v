module CONTROLLER_TESTBENCH(
    input wire [6:0] a,
    input wire [6:0] b,      // unused in this example
    input wire [2:0] op,
    output reg [6:0] result,
    output wire flag
);

// op = 0 → NOT
// op = 1 → Rotate Right
// op = 2 → NOP (pass-through or set to 0)

always @(*) begin
    case (op)
        3'd0: result = ~a;
        3'd1: result = {a[0], a[6:1]};  // Rotate right
        default: result = 7'd0;
    endcase
end

assign flag = |result;  // Flag is 1 if result > 0, else 0

endmodule
