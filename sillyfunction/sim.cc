#include "Vsillyfunction.h"
#include "verilated_vcd_c.h"
#include <iostream>
#include <memory>

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    auto sillyfunction = std::make_unique<Vsillyfunction>();
    auto tfp = std::make_unique<VerilatedVcdC>();
    vluint64_t main_time = 0;
    sillyfunction->trace(tfp.get(), 99);
    tfp->open("sim.vcd");

    sillyfunction->a = 0;
    sillyfunction->b = 0;
    sillyfunction->c = 0;

    while(!Verilated::gotFinish()) {
        sillyfunction->eval();
        main_time++;
        tfp->dump(main_time);

        if(main_time > 0) {
            break;
        }
    }
    tfp->close();
    sillyfunction->final();
    std::cout << "y: " << int(sillyfunction->y) << std::endl;;
}
