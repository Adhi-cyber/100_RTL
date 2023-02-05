module pipo_des(clk, pi, po);

input [3:0] pi;
input clk;

output reg [3:0] po;

always @(posedge clk)
begin
	po<=pi;
end
endmodule

