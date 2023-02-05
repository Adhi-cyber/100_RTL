module siso_des(clk, si, so);

input clk;
input si;

output reg so;

always @(posedge clk)
begin
	so <= si;
end
endmodule
