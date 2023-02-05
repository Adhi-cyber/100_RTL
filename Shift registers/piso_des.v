module piso_des(clk, po, si);

input [3:0] po;
input clk;

output reg si;

reg [3:0]temp;

always @(posedge clk)
begin
	temp <= po;
	temp <= temp <<1;
	si <= temp[0];
end
endmodule
