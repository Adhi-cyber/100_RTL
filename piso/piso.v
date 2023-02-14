module piso(clk,rst,d,q);
  
input clk,rst;
  input [3:0]d;
output reg q;
 reg [3:0]temp;
  
  
  always@(posedge clk,posedge rst) begin
    if(rst == 1)begin
		q <= 0;
		temp <= d;
	end else begin
		q <= temp[0];
		temp <= temp >> 1;
	end
end
endmodule
