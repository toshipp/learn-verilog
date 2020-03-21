// iverilogのリリースバージョン(10.3)では即時assertがサポートされていないのでマクロを用意しておく
// masterブランチでは使えるのでそっちを使うのも手。
// https://github.com/steveicarus/iverilog/issues/193
`define myassert(cond, message) \
   if(!(cond)) begin \
      $display(message); \
      $finish; \
    end

module testbench2();
   logic a, b, c, y;
   // テストするデバイスをインスタンス化
   sillyfunction dut(a, b, c, y);
   // 結果をチェックする
   initial begin
      a = 0; b = 0; c = 0; #10;
      // `myassert(y===1, "000 failed");
      assert (y === 1) else $error("000 failed.");
      c = 1; #10;
      assert (y === 0) else $error("001 failed.");
      b = 1; c = 0; #10;
      assert (y === 0) else $error("010 failed.");
      c = 1; #10;
      assert (y === 0) else $error("011 failed.");
      a = 1; b = 0; c = 0; #10;
      assert (y === 1) else $error("100 failed.");
      c = 1; #10;
      assert (y === 1) else $error("101 failed.");
      b = 1; c = 0; #10;
      assert (y === 0) else $error("110 failed.");
      c = 1; #10;
      assert (y === 0) else $error("111 failed.");
   end
endmodule
