module control (  
	input clk,   
	input [31:0] instruction,
	output  reg branch,
	output reg mem_read,
	output reg mem_to_reg,
	output reg [1:0] alu_op,
	output reg mem_write,
	output reg alu_src,
	output reg reg_write
 );  
 
	assign ins = instruction[6:0];
  
  
  always@(posedge clk)
  case(ins)
    
    51 :begin
         alu_op = 2;
         reg_write = 1;
         mem_read = 0;
         mem_write = 0;
		 branch = 0;
		 mem_to_reg = 0;
		 alu_src = 0;
        end 
        
    3 : begin
        alu_op = 0;
        reg_write = 1;
        mem_read = 1;
        mem_write = 0;
		branch = 0;
		 mem_to_reg = 1;
		 alu_src = 1;
        end
        
    35 :begin
        alu_op = 0;
        reg_write = 0;
        mem_read = 0;
        mem_write = 1;
		branch = 0;
		 mem_to_reg = 0;
		 alu_src = 1;
        end
        
    99 :begin
         alu_op = 1;
         reg_write = 0;
         mem_read = 0;
         mem_write = 0;
		 branch = 1;
		 mem_to_reg = 0;
		 alu_src = 0;
        end
  endcase

    
endmodule   