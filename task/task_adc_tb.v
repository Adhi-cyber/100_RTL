module task_adc_tb;

reg [7:0] adc_a;

wire [7:0] out;

task_adc uut(.adc_a(adc_a),
		.out(out));

initial 
begin
	$dumpfile("adcwave.vcd");
	$dumpvars(0,task_adc_tb);
	adc_a = 8'b00000000;
end

always #2 adc_a =  adc_a + 1;

endmodule
