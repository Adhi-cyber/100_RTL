module sipo_tes;

reg clk;
reg si;

wire [3:0] po;

sipo_des uut(.clk(clk), .si(si), .po(po));

initial 
begin
	$dumpfile("sipo_wave.vcd");
	$dumpvars(0,sipo_tes);

	clk = 0;
	si = 0;

	#10 si = 1'b1;
	#10 si = 1'b0;
	#10 si = 1'b0;
	#10 si = 1'b1;
end

always #5 clk = ~clk;

initial #150 $finish;

endmodule
