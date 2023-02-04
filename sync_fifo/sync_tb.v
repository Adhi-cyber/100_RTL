module sync_tb;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg wr_data;

wire rd_data;
wire full;
wire empty;

sync uut(.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), .wr_data(wr_data), .rd_data(rd_data), .full(full), .empty(empty));


initial 
begin
	$dumpfile("wave.vcd");
	$dumpvars(0,sync_tb);

	clk = 0;
	rst = 0;
	wr_en = 1'b0;
	rd_en = 1'b0;
	wr_data = 8'b00000000;
end
	always #1 clk = ~clk; 
	always #2 rst = ~rst;	
	always #5 wr_data = wr_data + 1'b1;
	always #3 wr_en = wr_en + 1'b1;
	always #3 rd_en = rd_en + 1'b1;
	initial #50 $finish;

	endmodule	
