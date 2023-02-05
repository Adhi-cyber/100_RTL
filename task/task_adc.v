module task_adc(adc_a, out);

input [7:0] adc_a;
output reg [7:0] out;

task convert;
	input [7:0] adc_in;
	output reg [7:0] out;
	begin 
	out = (9/5)*(adc_in +32);
end
endtask

always@ (adc_a)
begin 
convert (adc_a,out);
end

endmodule 
