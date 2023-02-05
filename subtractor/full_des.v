module full_des(a,b,bin, d, bo);

input a;
input b;
input bin;

output reg d;
output reg bo;

always @(*)
begin
	d = a^b^bin;
	bo = ((~a)&b | (~(a^b) &bin) );
end

endmodule

