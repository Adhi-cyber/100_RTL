module dff_sync(d,clk,rst,q);

input d;
input clk;
input rst;

output reg q;

always @(posedge clk )
begin
	if(rst==0)
		q <= d;
	else
		q <=0;
end

endmodule
