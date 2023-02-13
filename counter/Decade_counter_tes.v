module decadecountertb;
wire[3:0]count;
reg en,clock;
decadecounter uut(.en(en),.count(count),.clock(clock));
initial
begin
	$dumpfile("decadecounter.vcd");
	$dumpvars(0,decadecountertb);


	#10 clock=~clock;
        #15 en=0;
	#15 clk=0;
end
endmodule
