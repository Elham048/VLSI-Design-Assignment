module ALU_TESTBENCH;
    reg [6:0] A, B;
    reg [1:0] OP;
    wire [6:0] R;
    wire CF, SF, ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("test7.vcd");
        $dumpvars(0, ALU_TESTBENCH);

        // Test NOT operation
        A = 7'b1010101; B = 7'b0000000; OP = 2'b00; #10;
        A = 7'b0000000; B = 7'b0000000; OP = 2'b00; #10;

        // Test Rotate Right by various amounts
        A = 7'b1000001; B = 7'b0000001; OP = 2'b01; #10; // Rotate by 1
        A = 7'b1100001; B = 7'b0000010; OP = 2'b01; #10; // Rotate by 2
        A = 7'b1111111; B = 7'b0000101; OP = 2'b01; #10; // Rotate by 5
        A = 7'b1000000; B = 7'b0000011; OP = 2'b01; #10; // Rotate by 3
        A = 7'b0000001; B = 7'b0000011; OP = 2'b01; #10; // Rotate by 3
        A = 7'b1000001; B = 7'b0000000; OP = 2'b01; #10; // Rotate by 0
        A = 7'b1000001; B = 7'b0000111; OP = 2'b01; #10; // Rotate by 7 (same as original)

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b", $time, A, B, OP, R, CF, ZF, SF);
    end
endmodule
