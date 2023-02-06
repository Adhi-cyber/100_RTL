module four_to_one_tes;

reg [3:0]in;
reg  s;

wire out;

four_to_one_des uut(.in(in), .out(out), .s(s));

initial
begin
	$dumpfile("4x1wave.vcd");
	$dumpvars(1,four_to_one_tes);

	in = 0;
	s = 2'b00;
end

always #2 s = s + 1'b1;
always #1 in = in + 1'b1;

endmodule
