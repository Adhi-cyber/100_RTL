module seq_101_tb;

reg clk;
reg rst;
reg seqin;

wire dout;

seq_101 uut(.clk(clk),
	.rst(rst),
	.seqin(seqin),
	.dout(dout));

initial 
begin 
$dumpfile("seq_101_wave.vcd");
$dumpvars(0,seq_101_tb);
clk = 1'b0;
rst = 1'b0;
seqin = 1'b0;
end

always #2 clk = clk + 1'b1;
always #4 rst = rst + 1'b1;
always #1 seqin = seqin+ 1'b1;

initial #50 $finish;

endmodule
