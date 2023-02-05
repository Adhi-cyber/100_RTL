module siso_tes;

reg clk;
reg [3:0] si;

wire so;

pipo_des uut(.clk(clk), .si(pi), .so(so));

initial
begin
	$dumofile("pipowave.vcd");
	$dumpvars(1,siso_tes);
	clk = 0;
	si = 1'b1;
	#2 = 1'b0;
	#2 = 1'b0;
end

always #20 clk = ~clk;

initial #120 $finish;

endmodule
