module pipo_tes;

reg clk;
reg [3:0] pi;

wire [3:0] po;

pipo_des uut(.clk(clk), .pi(pi), .po(po));

initial
begin
	$dumofile("pipowave.vcd");
	$dumpvars(1,pipo_tes);
	clk = 0;
	pi = 4'b0000;
	#2 pi = 4'b1100;
	#2 pi = 4'b0011;
end

always #20 clk = ~clk;

initial #120 $finish;

endmodule
