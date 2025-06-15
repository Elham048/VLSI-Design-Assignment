main:
	iverilog -o alu_fsm TOP.v CONTROLLER.v CONTROLLER_TESTBENCH.v TOP_TESTBENCH.v
	vvp alu_fsm
	gtkwave alu_fsm.vcd &
