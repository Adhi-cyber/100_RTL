module nonblock_assign_des_2(din, clk, a, b, c);

input din;
input clk;

output reg a;
output reg b;
output reg c;

always @(posedge clk)
begin
	a <= din;
        b <= a;
        c <= b;
end
endmodule

module nonblock_assign_tes_2;

reg din;
reg clk;

wire a;
wire b;
wire c;

nonblock_assign_des_2 uut(.din(din),
        .clk(clk),
        .a(a),
        .b(b),
        .c(c));

initial
begin
        $dumpfile("nonblock_wave_2.vcd");
        $dumpvars(0,nonblock_assign_tes_2);
        din = 1'b1;
        clk = 1'b0;
end

always #2 clk = clk + 1'b1;

endmodule
