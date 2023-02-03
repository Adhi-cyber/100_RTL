module four_full_add_des (a,b,cin,s,co);

//input 
input [3:0] a;
input [3:0] b;
input cin;

//output
inout [3:0] s;
inout co;

wire [2:0] c;

full_add fsa1(s[0],c[0],a[0],b[0],cin);
full_add fsa2(s[1],c[1],a[1],b[1],c[0]);
full_add fsa3(s[2],c[2],a[2],b[2],c[1]);
full_add fsa4(s[3],c[3],a[3],b[3],c[2]);

endmodule

module full_add (input a,b,cin,output s,co);
assign s = a^b^cin;
assign co = (a&b) | (b&cin) | (cin&a);
endmodule
