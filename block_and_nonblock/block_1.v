module block_assign_des(din, clk, a, b, c);

input din;
input clk;

output reg a;
output reg b;
output reg c;

always @(posedge clk)
begin
	a = din;
        b = a;
        c = b;

end
endmodule

module block_assign_tes;

reg din;
reg clk;

wire a;
wire b;
wire c;

block_assign_des uut(.din(din),
        .clk(clk),
        .a(a),
        .b(b),
        .c(c));

initial
begin
        $dumpfile("block_wave_1.vcd");
        $dumpvars(0,block_assign_tes);
        din = 1'b1;
        clk = 1'b0;
end

always #2 clk = clk + 1'b1;

endmodule




