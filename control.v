module memory (  
	input clk,   
	input [63:0] instruction,
	output [1:0] branch,
	output [1:0] mem_read,
	output [1:0] mem_to_reg,
	output [1:0] alu_op,
	output [1:0] mem_write,
	output [1:0] alu_src,
	output [1:0] reg_write
 );  
    
 endmodule   