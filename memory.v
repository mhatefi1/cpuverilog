module memory (  
	input clk,   
	input [63:0] address,
	input [63:0] write_data,  
	input write_en,  
	input read_en,  
	output [63:0] read_data
 );  
	integer i;  
	reg [63:0] ram [255:0];  
	wire [7 : 0] ram_address = address[8 : 1];  
	initial begin  
		for(i=0;i<256;i=i+1)  
			ram[i] <= 16'd0;  
	end  
	always @(posedge clk) begin  
	   if (write_en)  
			ram[ram_address] <= write_data;  
	end  
	assign read_data = (read_en==1'b1) ? ram[ram_address]: 16'd0;   
endmodule   