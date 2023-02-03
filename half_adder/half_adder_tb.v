module halfaddert_b;

reg a;

reg b;

wire s;

wire c;

ha uut ( .a(a),.b(b),.s(s), .c(c));

initial begin
#10 a=1’b0;b=1’b0;                       

#10 a=1’b0;b=1’b1;                       

#10 a=1’b1;b=1’b0;  
  
#10 a=1’b1;b=1’b1;                      

#10$stop;

end

endmodule
