module testbench1();
   logic a, b, c, y;
   // instantiate device under test
   sillyfunction dut(a, b, c, y);
   // apply inputs one at a time
   initial begin
      $dumpfile("testbench1.vcd");
      // iverilogではデフォルトでは波形が出ないので明示的に記録する
      $dumpvars(0, testbench1);

      a = 0; b = 0; c = 0; #10;
      c = 1;               #10;
      b = 1; c = 0;        #10;
      c = 1;               #10;
      a = 1; b = 0; c = 0; #10;
      c = 1;               #10;
      b = 1; c = 0;        #10;
      c = 1;               #10;
   end
endmodule // testbench1
