module jk_ff_des (j, k, clk, q);

input j;
input k;
input clk;

output reg q;

always @(*)
begin
	case({j,k})
		2'b00: q <= q;
		2'b01: q <= 0;
		2'b10: q <= 1;
		2'b11: q <= ~q;
	endcase
end
endmodule

