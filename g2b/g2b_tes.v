module g2b_tes;

reg [3:0] g_in;
wire [3:0] b_out;

g2b_des uut(.g_in(g_in), .b_out(b_out));

initial
begin
	$dumpfile("g2b_wave.vcd");
	$dumpvars(1,g2b_tes);

	g_in = 4'b0000;
end

always #2 g_in = g_in +1'b1;

initial #50 $finish;

endmodule
