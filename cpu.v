module cpu();

reg pc_data;
wire clk;
reg pc_reset;
wire pc;
reg ins_address;
wire ins_read_data;
reg ins_write_data;
reg ins_write_enable;
reg ins_read_enable;

clock my_clock(clk);
pc my_pc(.pc_data(pc_data), .clk(clk), .pc_reset(pc_reset), .pc(pc));
instruction_memory im(.clk(clk),
	.ins_address(ins_address),
	.ins_write_data(ins_write_data),
	.ins_write_enable(ins_write_enable),
	.ins_read_enable(ins_read_enable),
	.ins_read_data(ins_read_data)
);

reg_bank rb(.clk(clk),
	.ins_read_data[19 : 15](ins_read_data[19 : 15]),
	.ins_read_data[24 : 20](ins_read_data[24 : 20]),
	.ins_read_data[11 : 7](ins_read_data[11 : 7]),
	.ins_write_data(ins_write_data),
	.ins_write_enable(ins_write_enable),
	.ins_read_enable(ins_read_enable),
	.ins_read_data(ins_read_data)
);


endmodule;