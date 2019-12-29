module mlti(input select, a, b, output reg [63:0] out);
	input select, a, b;

	always@(select or a or b) begin
	if(select == 0)
		out <= a;
	else 
		out <= b;
	end

endmodule;
