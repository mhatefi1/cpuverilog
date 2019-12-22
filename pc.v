module pc(data, clk, reset, out);
input data,clk,reset;
parameter n=63;
output	[n:0]	out;
reg	[n:0]	out;

always @(posedge clk)
begin
	if (!reset)
		out <= data;
	else
		out <= 0;
end

endmodule;