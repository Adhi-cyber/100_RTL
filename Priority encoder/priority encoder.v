module pr_enc(in,out);

  input [3:0]in;
  output reg [2:0]out;
    
  always @(in)
    casex(in)
      4'b0000:out=3'b000;
      4'b0001:out=3'b001;
      4'b001X:out=3'b010;
  	  4'b01XX:out=3'b011;
      4'b1XXX:out=3'b100;
    endcase
endmodule
