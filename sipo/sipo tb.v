module sipo_tb;
  
  reg clk,rst,d;
  wire [3:0] q;
  
  reg[3:0] s;
  
  sipo dut(clk,rst,d,q);
    
initial begin
	clk <= 0;
  forever #100 clk= ~clk;
end
initial begin
  d=0;rst=1;
#100 rst=0; d = 1;
#100 ; d = 1;
  #100 ; rst =1; d = 0;
  #100 ; d = 0;
  #100 ; d = 0;
  $monitor(" T=%0t, rst=%b  d=%0b, q=%0b ", $time,rst,d,q);
  #2000 $finish;
end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule
