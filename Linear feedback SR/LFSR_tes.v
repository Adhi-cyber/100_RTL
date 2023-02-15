module lfsr64_tb ();
  
  reg clk;
  reg reset_n;
  
  wire [63:0] lfsr;
  wire lfsr_to;
 
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,u_dut);
    end
  	
  initial
    begin
            reset_n = 1'b1;
            clk = 1'b1;
      #10   reset_n = 1'b0;
      #10   reset_n = 1'b1;
      #10000 $finish;
    end
  
  always #1 clk = ~clk;
  
  LFSR8_8E u_dut(
    .clock(clk),
    .reset_(reset_n),
    .q(lfsr),
    .lfsr_to(lfsr_to)
  );
  
endmodule
