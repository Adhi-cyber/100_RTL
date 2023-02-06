module t_ff(t, rst, q);

input t;
input rst;

output reg q;

always @(*)
	begin
		if(rst == 1)
			q <= 0;
		else 
			if(t)
				q <= ~q;
			else
				q <= q;
		end
		endmodule
