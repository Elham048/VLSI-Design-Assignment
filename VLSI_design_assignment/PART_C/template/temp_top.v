module temp_top
(
    input wire clk, reset, start,
    input wire [6:0] troom, tref, dt,
    output wire h,
    output wire c
);

wire [3:0] datapath_out;
wire [6:0] datapath_in1, datapath_in2, datapath_in3;

temp_controller controller1
(
    .clk(clk), 
    .reset(reset), 
    .start(start),
    .troom(troom), 
    .tref(tref), 
    .dt(dt),
    .h(h),
    .c(c),
    .datapath_in1(datapath_in1), 
    .datapath_in2(datapath_in2), 
    .datapath_in3(datapath_in3), 
    .datapath_out(datapath_out)
);

temp_datapath datapath1
(
    .datapath_in1(datapath_in1), 
    .datapath_in2(datapath_in2), 
    .datapath_in3(datapath_in3), 
    .datapath_out(datapath_out)
);

endmodule