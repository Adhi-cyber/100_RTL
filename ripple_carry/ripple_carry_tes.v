module ripple_carry_adder_tb;

	reg [3:0] in0;
	reg [3:0] in1;
	wire [3:0] out;
	wire cout;

	ripple_carry_adder rca(.in0(in0), .in1(in1), .out(out), .cout(cout));

	initial begin
		in0 = 4'b0000; in1 = 4'b0000; #10
		in0 = 4'b0000; in1 = 4'b0001; #10
		in0 = 4'b0000; in1 = 4'b0010; #10
		in0 = 4'b0000; in1 = 4'b0011; #10
		in0 = 4'b0000; in1 = 4'b0100; #10
		in0 = 4'b0000; in1 = 4'b0101; #10
		in0 = 4'b0000; in1 = 4'b0110; #10
		in0 = 4'b0000; in1 = 4'b0111; #10
		in0 = 4'b0000; in1 = 4'b1000; #10
		in0 = 4'b0000; in1 = 4'b1001; 
		end
endmodule
