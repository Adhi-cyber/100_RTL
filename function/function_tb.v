module function_tb;

reg a;
reg b;
reg c;
reg d;
reg e;

wire f;

function_calling uut(.a(a),
		     .b(b),
	     	     .c(c),
	     	     .d(d),
		     .e(e),
		      .f(f));


	      initial
	      begin
		      $dumpfile("functionwave.vcd");
		      $dumpvars(0,function_tb);
		      {a,b,c,d,e} = 5'b00000;
		      #2{a,b,c,d,e} = 5'b00001;
		      #2{a,b,c,d,e}  = 5'b00010;
		      #2{a,b,c,d,e} = 5'b00110;
	      end
      initial #20 $finish;
      endmodule

