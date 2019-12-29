module alu__control (  
	input clk,   
	input [31:0] instruction,
	input [1:0] op,
	output reg [3:0] out
 );  
	
	wire[9:0] ins = {instruction[31 : 25], instruction[14 : 12]};
	wire in =  {op, ins};

	always @(in, posedge clk)
	begin
		casex (in)
			12'b00xxxxxxxxxx: out=4'b0010;
			12'b01xxxxxxxxxx: out=4'b0110;
			12'b100000000000: out=4'b0010;
			12'b100100000000: out=4'b0110;
			12'b100000000111: out=4'b0000;
			12'b100000000110: out=4'b0001;
			default: out=4'b0000;
		endcase
	end
 
endmodule;