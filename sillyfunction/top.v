module top(input logic a, b, c, output logic y);
   initial begin
      assign y = ~a & ~b & ~c |
                 a & ~b & ~c |
                 a & ~b & c;
      $finish;
   end
endmodule
