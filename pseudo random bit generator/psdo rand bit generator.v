module psdo_gen (random, clk, reset);
 
input clk, reset;
 
output random;
wire random;
reg [3:0] temp;
always @ (posedge reset)
 begin
 temp <= 4'hf;
end
always @ (posedge clk) begin
 if (~reset) begin
 temp <= {temp[0]^temp[1],temp[3],temp[2],temp[1]};
 end
end
assign random = temp[0];
endmodule 
