all:
	verilator --cc top.v --exe sim.cc
	make -C obj_dir -f Vtop.mk
	obj_dir/Vtop
