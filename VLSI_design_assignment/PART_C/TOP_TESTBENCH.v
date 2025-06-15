`timescale 1ns/1ns

module alu_fsm_tb;
reg clk, reset;
wire [6:0] result;
wire flag;

TOP top (
    .clk(clk), .reset(reset),
    .result(result), .flag(flag)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("alu_fsm.vcd");
    $dumpvars(0, TOP_TESTBENCH);

    reset = 1;
    #10;
    reset = 0;

    #100;  // Run for a few clock cycles
    $finish;
end
endmodule
