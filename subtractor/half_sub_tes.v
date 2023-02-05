module half_tes;

reg a;
reg b;

wire d;
wire bo;

half_des uut(.a(a), .b(b), .d(d), .bo(bo));

initial
begin
	$dumpfile("half_wave.vcd");
	$dumpvars(1,half_tes);
	a = 1'b0;
	b = 1'b0;
end

always #2 a = a + 1'b1;
always #1 b = b + 1'b1;

initial #50 $finish;

endmodule
