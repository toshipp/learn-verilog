all:

obj_dir/Vsillyfunction: sillyfunction.sv sim.cc
	verilator --trace --cc sillyfunction.sv --exe sim.cc
	make -C obj_dir -f Vsillyfunction.mk

sim: obj_dir/Vsillyfunction
	@obj_dir/Vsillyfunction

show:
	yosys -s show.ys

testbench1.vvp: sillyfunction.sv testbench1.sv
	iverilog -g2005-sv -o $@ $^

testbench2.vvp: sillyfunction.sv testbench2.sv
	iverilog -g2005-sv -o $@ $^

clean:
	rm -rf obj_dir *.vvp

.PHONY: all sim show clean
