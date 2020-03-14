all:
	verilator --trace --cc top.v --exe sim.cc
	make -C obj_dir -f Vtop.mk
	obj_dir/Vtop

show:
	yosys -s yosys.tcl
