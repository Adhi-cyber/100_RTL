module four_bit_alu (a, b,  out, of, sel);

input wire [3:0] a;
input wire [3:0] b;

output wire [3:0] out;
output wire of;

input wire  [1:0] sel;

reg [4:0] interout;
reg overflow;

always @(*)
begin
	case(sel)

		2'b00: begin
			interout = a|b;
		end

		2'b01: begin
			interout = a&b;
		end
		
		2'b10: begin
			interout = a+b;
			overflow = interout[4];
		end

		2'b11: begin
			interout = a-b;
		end
	endcase
end

assign out = interout[3:0];
assign of = overflow;
endmodule

