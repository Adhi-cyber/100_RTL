module function_calling (a, b, c, d, e, f);

input a,b,c,d,e;
output wire f;

function my_function;
       input a,b,c,d;	
	begin 
	my_function = ((a+b)+(c-d));
end
endfunction

assign f = (my_function(a,b,c,d)) ? e:0;

endmodule
