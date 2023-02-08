module test_demux;
reg [2:0]S;
reg A;
wire [7:0]Y;
demux_1_8 mydemux(.y(Y), .a(A), .s(S));
initial begin
A=1;
S=3'd5;
#30;
A=0;
S=3'd1;
#30;
A=1;
S=3'd1;
#30;

S=3'd6;
#30;

S=3'd0;

#30;
$finish;

end
endmodule
