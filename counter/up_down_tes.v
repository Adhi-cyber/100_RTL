module up_down_tes;

reg clk, reset, load,  up_down;

reg [3:0] data;

wire [3:0] count;


up_down_des uut(.clk(clk), .*);

initial
begin
	$dumpfile("up_down.vcd");
	$dumpvars(0,up_down_tes);

	clk = 0;
	reset = 0;
	load = 0;
	data = 4'b0000;
end

always #3  clk = ~clk;
always #7 reset = 1'b1;
always #12 load = 1'b1;
always #5 up_down = 1'b1;
always #14 data = data + 1'b1;

initial #100 $finish;
endmodule

