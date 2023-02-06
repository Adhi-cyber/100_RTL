module dff_async_tb;

reg d;
reg clk;
reg rst;

wire q;

dff_async uut(.clk(clk),
	.rst(rst),
	.d(d),
	.q(q));

initial
begin
	$dumpfile("dff_async_wave.vcd");
	$dumpvars(0,dff_async_tb);
	d = 1'b0;
	rst = 1'b0;
	clk = 1'b0;

	#5 d = 1'b1;
	#10 clk = 1'b1;
	#15 rst = 1'b1;
end
endmodule
