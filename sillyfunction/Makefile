all:
	verilator --trace --cc sillyfunction.sv --exe sim.cc
	make -C obj_dir -f Vsillyfunction.mk
	obj_dir/Vsillyfunction

show:
	yosys -s show.ys
