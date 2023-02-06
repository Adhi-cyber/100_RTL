module jk_ff_tes;

reg j;
reg k;

wire q;

jk_ff_des uut (.j(j), .k(k), .q(q));

initial
begin
	$dumpfile("jk_wave.vcd");
	$dumpvars(1,jk_ff_tes);

	{j,k} = 2'b00;
	#2 {j,k} = 2'b01;
	#2 {j,k} = 2'b10;
	#2 {j,k} = 2'b11;

end

initial #50 $finish;

endmodule
