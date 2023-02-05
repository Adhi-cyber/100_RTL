module full_tes;

reg a;
reg b;
reg bin;

wire d;
wire bo;

full_des uut(.a(a), .b(b), .bin(bin), .d(d), .bo(bo));

initial 
begin
	$dunpfile("full_Wave.vcd");
	$dumpvars(1,full_tes);
	a = 0;
	b = 0;
	bin = 0;
end

always #4 = a + 1'b1;
always #2 = b + 1'b1;
always #1 = bin + 1'b1;
