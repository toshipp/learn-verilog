#include "Vtop.h"
#include "verilated_vcd_c.h"
#include <iostream>
#include <memory>

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    auto top = std::make_unique<Vtop>();
    auto tfp = std::make_unique<VerilatedVcdC>();
    vluint64_t main_time = 0;
    top->trace(tfp.get(), 99);
    tfp->open("sim.vcd");

    top->a = 0;
    top->b = 0;
    top->c = 0;

    while(!Verilated::gotFinish()) {
        top->eval();
        main_time++;
        tfp->dump(main_time);

        if(main_time > 0) {
            break;
        }
    }
    tfp->close();
    top->final();
    std::cout << "y: " << int(top->y) << std::endl;;
}
