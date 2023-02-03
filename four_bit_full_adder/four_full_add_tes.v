module four_full_add_tes;

//input
reg [3:0] a;
reg [3:0] b;
reg cin;

//output
wire [3:0] out;
wire co;

four_full_add_des uut(.a(a), .b(b), .cin(cin), .s(out), .co(co));


initial 
begin
	$dumpfile("four_full_add_wave.vcd");
	$dumpvars(0,four_full_add_tes);
	a = 4'b0000;
	b = 4'b0000;
	cin = 0;
end 

always #2 a = a + 1'b1;
always #1 b = b + 1'b1;

initial #20 $finish;

endmodule
