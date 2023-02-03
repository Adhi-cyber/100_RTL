module full_adder_df (input a,b,cin,output s,co);

assign s = a^b^cin;
assign co = (a&b) | (b&cin) | (cin&a);
endmodule
