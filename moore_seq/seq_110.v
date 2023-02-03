module seq_110(clk, rst, seqin, dout);

input clk;
input rst;
input seqin;

output reg dout;

parameter idle = 4'b0001,
	s0 = 4'b0010,
	s1 = 4'b0100,
	s2 = 4'b1000;

reg [3:0] present,next;

always@ (posedge clk)
begin
	if(rst)
		present <= idle;
	else
		present <= next;
end

always@ (present, seqin)
begin
	case(present)
		idle : begin dout = 1'b0;
	       		if(seqin)  next = s0; end
		s0 : begin dout = 1'b0; 
			if(seqin) next = s1; end
		s1 : begin dout = 1'b0;
			if(~seqin) next = s2; 
				else next = s1; end
		s2 : begin dout = 1'b1;
			if(seqin)  next = s0; end
	endcase
end

endmodule 
