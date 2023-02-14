module test();
  reg clk, rst_n;
  reg [3:0] in_request;
  wire [3:0] out_grant;
  
   initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  priority_arbiter DUT (clk, rst_n, in_request, out_grant);
  
  
  initial begin
    clk = 0;
    rst_n = 0;
    in_request = 4'b0011;
    @(negedge clk);
    @(negedge clk) rst_n = 1;
    @(negedge clk) in_request = 4'b0111;
    @(negedge clk) in_request = 4'b1010;
    @(negedge clk) in_request = 4'b1100;
    #20 $finish;
  end
  
  always #2 clk = ~clk;
  
endmodule
