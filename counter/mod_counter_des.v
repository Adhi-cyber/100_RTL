module mod_n_cntr_des (
input clk,
input rst,
output reg  [3:0]out
);

always @(posedge clk)
begin
	if(!rst)
		out <= 0;

	else
	begin
		if(out == 9)
			out <= 0;
		else
			out <= out +1;
	end
end
endmodule
