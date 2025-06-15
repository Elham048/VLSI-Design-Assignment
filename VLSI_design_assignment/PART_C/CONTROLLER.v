module CONTROLLER(
    input wire clk, reset,
    output reg [6:0] a, b,
    output reg [2:0] op,
    input wire [6:0] result,
    input wire flag
);

reg [2:0] state, next_state;

parameter START  = 3'b000,
          ONE    = 3'b001,
          TWO    = 3'b010,
          THREE  = 3'b011,
          FINISH = 3'b100;

always @(posedge clk or posedge reset) begin
    if (reset) state <= START;
    else state <= next_state;
end

always @(*) begin
    a = 7'd0; b = 7'd0; op = 3'd0;
    case (state)
        START:  next_state = ONE;
        ONE: begin
            a = 7'b0101010; op = 3'd0; // NOT
            next_state = TWO;
        end
        TWO: begin
            a = 7'b0001101; op = 3'd1; // ROTATE RIGHT
            next_state = THREE;
        end
        THREE: begin
            a = 7'd0; op = 3'd2;       // NOP or final test case
            next_state = FINISH;
        end
        FINISH: next_state = FINISH;
        default: next_state = START;
    endcase
end

endmodule
