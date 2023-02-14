module psdo_gen_tb();
reg clk, reset;
wire random;
  psdo_gen pr (random, clk, reset);
initial begin
 forever begin
 clk <= 0;
 #5
 clk <= 1;
 #5
 clk <= 0;
 end
end
initial begin
 reset = 1;
 #12
 reset = 0;
 #90
 reset = 1;
 #12
 reset = 0;
end
initial 
begin
  $monitor(" Random bit : %b | Reset=%b | Clock=%b", random,reset,clk);
#1000 $finish;
end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
