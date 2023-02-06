module d_lach_des(d, en, rst, q);

input d;
input en;
input rst;

output reg q;

always @(*)
	if (rst==1)
		q <=0;
	else
		if(en)
			q <= d;
endmodule
