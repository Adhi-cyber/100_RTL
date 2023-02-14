module sipo(clk,rst,d,q);
  
  input clk,rst,d;
  output [3:0] q;
  reg[3:0] temp;
  
  always@(posedge clk,posedge rst) begin
    if(rst == 1)
     temp <= 4'b0000;
   else begin
   temp <= temp << 1;
     temp[0] <= d;
   end
end
assign q = temp;
endmodule
