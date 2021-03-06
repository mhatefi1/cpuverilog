module reg_bank (  
	input clk,   
	input [31:0] instruction,
	input [63:0] write_data,  
	input write_en,  
	input read_en,  
	output [63:0] read_data1,
	output [63:0] read_data2
 );  
    integer i;  
    reg [63:0] ram [255:0];  
    wire [7 : 0] ram_address1 = instruction[19 : 15];  
	wire [7 : 0] ram_address2 = instruction[24 : 20];
	wire [7 : 0] ram_write_address = instruction[11 :7];
  
	initial begin  
	   for(i=0;i<256;i=i+1)  
			ram[i] <= 16'd0;  
      end  
	always @(posedge clk) begin  
	   if (write_en)  
			ram[ram_write_address] <= write_data;  
	end  
	assign read_data1 = (read_en==1'b1) ? ram[ram_address1]: 16'd0;
	assign read_data2 = (read_en==1'b1) ? ram[ram_address2]: 16'd0;   
 endmodule;   