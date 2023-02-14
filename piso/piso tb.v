module piso_tb;
reg clk,rst;
reg [3:0]d;
wire q;

reg [3:0]temp;
  
  piso dut(clk,rst,d,q);
    
initial begin
	clk <= 0;
  forever #100 clk= ~clk;
end
initial begin
  d = 4'b1101;rst=1;
  $monitor(" T=%0t, rst=%b  d=%0b, q=%0b temp = %b", $time,rst,d,q,temp);
#100 rst=0; 
  $monitor(" T=%0t, rst=%b  d=%0b, q=%0b temp = %b", $time,rst,d,q,temp);
#200 ; 
  $monitor(" T=%0t, rst=%b  d=%0b, q=%0b temp = %b", $time,rst,d,q,temp);
  #200 ; 
  $monitor(" T=%0t, rst=%b  d=%0b, q=%0b temp = %b", $time,rst,d,q,temp);
  #200 ;
 $monitor(" T=%0t, rst=%b  d=%0b, q=%0b temp = %b", $time,rst,d,q,temp);
  #10000 $finish;
  $monitor(" T=%0t, rst=%b  d=%0b, q=%0b temp = %b", $time,rst,d,q,temp);
end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule
