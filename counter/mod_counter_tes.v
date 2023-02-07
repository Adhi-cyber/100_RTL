module mod_n_cntr_tes;

reg clk;
reg rst;

wire [3:0]out;

mod_n_cntr_des uut(.clk(clk), .rst(rst), out(out));

initial
begin
	$dumpfile("mod_n_cntr.vcd");
	$dumpvars(0,mod_n_cntr_tes);

	clk = 0;
	rst = 0;
	out = 4'b0000;
end

always #10 clk = ~clk;

always #3 rst = ~rst;


initial #100 $finish;

endmodule
