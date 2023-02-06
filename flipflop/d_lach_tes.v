module d_lach_tes;

reg rst;
reg d;
reg en;

wire q;

d_lach_des uut(.rst(rst), .d(d), .en(en), .q(q));

initial
begin
	$dumpfile("d_lach_wave.vcd");
	$dumpvars(0, d_lach_tes);

	rst = 0;
	d = 0;
	en = 0;
end

always #10 rst = ~rst;
always #1 d = d + 1'b1;
always #7 en = ~en;

initial #100 $finish;

endmodule
