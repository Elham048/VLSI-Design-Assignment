module TOP(
    input wire clk, reset,
    output wire [6:0] result,
    output wire flag
);

wire [6:0] a, b;
wire [2:0] op;
wire [6:0] res;
wire f;

CONTROLLER controller(
    .clk(clk), .reset(reset),
    .a(a), .b(b), .op(op),
    .result(res),
    .flag(f)
);

CONTROLLER_TESTBENCH datapath(
    .a(a), .b(b), .op(op),
    .result(res), .flag(f)
);

assign result = res;
assign flag = f;

endmodule
