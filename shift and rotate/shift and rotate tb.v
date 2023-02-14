module shift_rotate_tb;

	reg [7:0] a;
	reg [2:0] opcode;

	wire [7:0] result;
	integer i;

	shift_rotate uut (
		.a(a), 
		.opcode(opcode), 
		.result(result)
	);

	initial begin
	a=8'b10110101;
	opcode = 000;
		
	end
	
	initial
	begin
	for(i=0;i<6;i=i+1)
	begin
	opcode=i;
	#10;
	end
	end
	
	initial
	$monitor(" A=%b | Opcode=%b | Result =%b ",a,opcode,result);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
