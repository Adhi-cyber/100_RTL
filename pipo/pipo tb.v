module pipo_tb;
  reg clk,rst;
  reg [3:0] a;
  wire[3:0] q;
  
pipo dut(clk,rst,a,q);
  
initial begin
	clk <= 0;
  forever #100 clk= ~clk;
end
  initial
    begin
      $dumpfile("dump.vcd"); 
      $dumpvars(1);
      #10000$finish;
    end
initial begin
  a=4'b1101;rst=1;
  $monitor(" T=%0t, rst=%b  a=%0b, q=%0b ", $time,rst,a,q);
#100 rst=0;
  $monitor(" T=%0t, rst=%b  a=%0b, q=%0b ", $time,rst,a,q);
#200 a=4'b1000;
  $monitor(" T=%0t, rst=%b  a=%0b, q=%0b ", $time,rst,a,q);
#300 rst=1;
  $monitor(" T=%0t, rst=%b  a=%0b, q=%0b ", $time,rst,a,q);
#500 rst=0;
  $monitor(" T=%0t, rst=%b  a=%0b, q=%0b ", $time,rst,a,q);
  #2000 $finish;
  
end
endmodule
