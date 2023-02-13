module ROM_tb;
reg [3:0] addr;
reg clk = 0;
wire [15:0] out;
ROM tb (
  .out(out),
  .addr(addr),
  .clk(clk)
);
always #5 clk = ~clk;
initial begin
  addr = 4'b0000;
  #10;
  if(out == 16'h5601)
   $display("Test 1 passed");
  addr = 4'b0001;
  #10;
if (out == 16'h3401)
 $display("Test 2 passed");
  addr = 4'b1111;
  #10;
  if(out == 16'h5401)
   $display("Test 3 passed");
end

endmodule
