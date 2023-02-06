module dff_sync_tb;

reg d;
reg clk;
reg rst;

wire out;

dff_sync uut(.clk(clk),
	.rst(rst),
	.d(d),
	.q(out));

initial
begin
	$dumpfile("dff_sync_wave.vcd");
	$dumpvars(0,dff_sync_tb);
	d = 1'b0;
	rst = 1'b0;
	clk = 1'b0;

	#5 d = 1'b1;
	#10 clk = 1'b1;
	#15 rst = 1'b1;
end
endmodule
