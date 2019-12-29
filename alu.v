module alu (  
	input clk,   
	input [3:0] select,
	input [63:0] input1,
	input [63:0] input2,
	output [1:0] zero,
	output [63:0] result
 );  
    
	always@(posedge clk, input1, input2, select)
	begin
		case(select)
			4'b0000:result<=input1&input2;
			4'b0001:result<=input1|input2;
			4'b0010:result<=input1+input2;
			4'b0110:result<=input1-input2;
		endcase
		
		if (result == 0)
			zero = 1;
		else
			zero = 0;
	end
  
 endmodule 