module sipo_des(clk, si, po);

input clk;
input si;
output reg [3:0] po;

reg [3:0] temp;

always @(posedge clk)
begin
	temp = temp<<1;
	temp[0] = si;
	po = temp;
end

endmodule 

