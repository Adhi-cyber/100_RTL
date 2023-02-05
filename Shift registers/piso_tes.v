module piso_tes;

reg clk;
reg [3:0] po;

wire si;

piso_des uut(.clk(clk), .po(po), .si(si));

initial 
begin
	$dumpfile("piso_wave.vcd");
	$dumpvars(1,piso_tes);

	clk = 0;
	po = 4'b0000;

	#10 po = 4'b0011;
	#10 po = 4'b1100;
end

always #20  clk = ~clk;

initial #150 $finish;

endmodule
