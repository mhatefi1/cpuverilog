module multi (  
      input clk,   
	input [63:0] a,
      input [63:0] b,  
	input [1:0] s,
      output [63:0] out
 );  
       if (write_en)  
               assign out = a; 
	else  
		assign out = b; 
 endmodule 