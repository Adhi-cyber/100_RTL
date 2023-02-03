module four_bit_ALU_tb();

reg tb_clk;
reg [3:0] tb_a;
reg [3:0] tb_b;
reg [1:0] tb_sel;
wire [3:0] tb_out;
wire tb_of;

four_bit_alu uut(.a(tb_a),
		.b(tb_b),
		.sel(tb_sel),
		.out(tb_out),
		.of(tb_of));

//clock generation
initial forever
begin
	#5 tb_clk = ~tb_clk;
end

//value initialzation
initial
begin
	tb_clk = 1'b0;
	tb_a = 4'b0000;
	tb_b = 4'b0000;
	tb_sel = 2'b00;
end

//vcd generation
initial 
begin
	$dumpfile("ALU.vcd");
	$dumpvars();
end

// simulation
always @(posedge tb_clk)
begin
	tb_a = $urandom;
	tb_b = $urandom;
	tb_sel = 2'b00;
	#10 tb_sel = 2'b01;
	#20 tb_sel = 2'b10;
	#20 tb_sel = 2'b11;
end
initial #70 $finish; 
endmodule 
