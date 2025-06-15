module temp_controller
(
    input wire clk, reset, start,
    input wire [6:0] troom, tref, dt,
    input wire [3:0] datapath_out,
    output reg h,
    output reg c,
    output wire [6:0] datapath_in1, datapath_in2, datapath_in3 
);

reg [3:0] pstate, nstate;

parameter [3:0] IDLE            = 4'b0000,
                HEAT            = 4'b0001,
                COOL            = 4'b0010,
                ERROR           = 4'b0101;

//Memory
//If reset pin is negative on pin, "negedge reset" in always condition and "~reset" in ifcondition need to be used
always @(posedge clk, posedge reset)
begin : PSR
    if(reset)
    begin
        pstate <= IDLE;
    end
    else
    begin
        pstate <= nstate;
    end
end

//Next State Logic
always@(*)
begin: NSOL
    if(pstate==IDLE)
        $monitor("pstate = IDLE -> clk = %b, reset = %b, start = %b, troom = %d, tref = %d dt = %d, dout = %b h = %b c = %b\n************************************\n", clk, reset, start, troom, tref, dt, datapath_out, h, c);
    else if(pstate==HEAT)
        $monitor("pstate = HEAT -> clk = %b, reset = %b, start = %b, troom = %d, tref = %d dt = %d, dout = %b h = %b c = %b\n************************************\n", clk, reset, start, troom, tref, dt, datapath_out, h, c);
    else if(pstate==COOL)
        $monitor("pstate = COOL -> clk = %b, reset = %b, start = %b, troom = %d, tref = %d dt = %d, dout = %b h = %b c = %b\n************************************\n", clk, reset, start, troom, tref, dt, datapath_out, h, c);

    nstate = pstate;

   begin: NSL
        case(pstate)
            IDLE: 
                begin
                    if(start)
                    begin
                        nstate = (datapath_out[0]) ? 
                                                HEAT 
                                                : (datapath_out[1]) ?
                                                    COOL
                                                    :IDLE;
                    end
                end
            HEAT:
                begin
                        nstate = (datapath_out[2]) ? 
                                                IDLE 
                                                :HEAT;
                end
            COOL:
                begin
                        nstate = (datapath_out[3]) ? 
                                                IDLE 
                                                :COOL;
                end
            default: nstate = ERROR;
        endcase

    end
    begin: OL
        case(pstate)
            IDLE: 
                begin
                    h = 1'b0;
                    c = 1'b0;
                end
            HEAT: 
                begin
                    h = 1'b1;
                    c = 1'b0;
                end
            COOL: 
                begin
                    h = 1'b0;
                    c = 1'b1;
                end

            default: nstate = ERROR;
        endcase

    end
end

assign datapath_in1 = troom;
assign datapath_in2 = tref;
assign datapath_in3 = dt;

endmodule