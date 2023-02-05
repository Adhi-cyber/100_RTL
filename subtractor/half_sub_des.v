module half_des(a, b, d, bo);

input a;
input b;

output reg d;
output reg bo;

always @(*)
begin
	d = a^b;
	bo = (~a)&b;
end

endmodule
