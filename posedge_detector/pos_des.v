module pos_edgedetect ( input sig, input clk, output pe);          

reg   signal;                          

always @ (posedge clk) begin
    signal <= sig;
  end
 
assign pe = sig & ~signal;            
endmodule 
