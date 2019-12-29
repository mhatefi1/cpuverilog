module multiplexer(input select, a, b, output [63:0] out);
	input select, a, b;
	output reg out;

	always@(select or a or b) begin
	if(select == 0)
		out <= a;
	else 
		out <= b;
	end

endmodule;
