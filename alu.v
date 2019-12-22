module alu (  
      input clk,   
	input [3:0] selection,
	input [63:0] input1,
	input [63:0] input2,
      input [1:0] zero,
      output [63:0] result
 );  
      

always @*
   if (selection == 4'b0000)  
   	assign result <= input1 && input2;
   else if (selection == 4'b0001)  
	assign result <= input1 || input2;
   else if (selection == 4'b0010)  
	assign result <= input1 + input2;
   else  
	assign result <= input1 - input2;
   end 
   #10
end
  
 endmodule 