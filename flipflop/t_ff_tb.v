module t_ff_tb;

reg t;
reg rst;

wire q;

t_ff uut(.t(t), .rst(rst), .q(q));

initial 
begin
	$dumpfile("t_ff_wave.vcd");
	$dumpvars(0, t_ff_tb);

	t = 1'b0;
	rst = 1'b0;
end

always #2 t = t + 1'b1;
always #5 rst = rst + 1'b1;

initial #100 $finish;

endmodule
