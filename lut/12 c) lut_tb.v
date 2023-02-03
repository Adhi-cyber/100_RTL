module lut_tb;

reg [11:0] in_tb;
wire [3:0] count_tb;

lut2 uut(.in(in_tb),
	.count(count_tb));

//vce Generation
initial 
begin
	$dumpfile("dump.vcd");
	$dumpvars();
end

//simulation generation

initial 
begin
	in_tb =12'b100001011100;
	
	#5 in_tb = 12'b010110101101;

	#2 in_tb = 12'b100001011100;
end

initial $display("time = %g input = %b  output = %b",$time, in_tb,count_tb);
endmodule
