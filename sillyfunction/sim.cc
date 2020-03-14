#include "Vtop.h"
#include "verilated.h"
#include <iostream>
#include <memory>

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    auto top = std::make_unique<Vtop>();
    top->a = 0;
    top->b = 0;
    top->c = 0;
    while (!Verilated::gotFinish()) { top->eval(); }
    top->final();
    std::cout << "y: " << int(top->y) << std::endl;;
}
