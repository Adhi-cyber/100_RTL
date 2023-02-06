module four_to_one_des(out, in, s);

input [3:0] in;
input s;

output reg out;

always @(*)
begin
	case(s)
	
		2'b00 : out = in[0];
		2'b01 : out = in[1];
		2'b10 : out = in[2];
		2'b11 : out = in[3];
	endcase
end
	endmodule
