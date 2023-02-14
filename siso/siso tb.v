module tb_siso;
  reg din;
  reg clk;
  reg reset;
  wire [3:0]s;
  wire dout;
  
  siso siso_test(din, clk, reset, dout);
  always #5 clk = ~clk;
initial
  begin
    $dumpfile("dump.vcd");
$dumpvars(1);
    
    clk <= 0;
    reset <= 1;
    #10
    reset = 0;
    din <= 1;
    #10
    reset = 0;
    din <= 0;
    #10
    reset = 0;
    din <= 1;
    #10
    reset = 0;
    din <= 1;
    #100
    $finish;
  end
  
endmodule
