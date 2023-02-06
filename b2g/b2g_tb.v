module b2g_tes;

reg [3:0] in;

wire [3:0] out;

b2g_des uut(.in(in), .out(out));

initial 
begin
	$dumpfile("b2g_wave.vcd");
	$dumpvars(1,b2g_tes);

	in = 4'b0000;
end

always #2 in = in + 1'b1;

initial #50 $finish;
endmodule
