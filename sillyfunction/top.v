module top(input logic a, b, c, output logic y);
   always y = ~a & ~b & ~c |
              a & ~b & ~c |
              a & ~b & c;
endmodule
