module cpu();

reg pc_data;
wire clk;
reg pc_reset;
wire pc;
wire instruction;
reg ins_write_data;
reg ins_write_enable;
reg ins_read_enable = 1;

reg rb_write_data;
reg rb_write_enable;
reg rb_read_enable = 1;
wire rb_read1;
wire rb_read2;

wire ctrl_branch;
wire ctrl_mem_read;
wire ctrl_mem_to_reg;
wire [1:0] ctrl_alu_op;
wire ctrl_mem_write;
wire ctrl_alu_src;
wire ctrl_reg_write;

wire alu_control;

wire imgen_out;

wire mux1_out;
wire mux2_out;

reg alu_input2;
wire alu_zero;
wire alu_out;

wire memory_read;

clock my_clock(clk);
pc my_pc(.pc_data(pc_data), .clk(clk), .pc_reset(pc_reset), .pc(pc));
instruction_memory im(.clk(clk),
	.pc(pc),
	.ins_write_data(ins_write_data),
	.ins_write_enable(ins_write_enable),
	.ins_read_enable(ins_read_enable),
	.instruction(instruction)
);

control ctrl(.clk(clk),
	.instruction(instruction),
	.ctrl_branch(ctrl_branch),
	.ctrl_mem_read(ctrl_v),
	.ctrl_mem_to_reg(ctrl_mem_to_reg),
	.ctrl_alu_op(ctrl_alu_op),
	.ctrl_mem_write(ctrl_mem_write),
	.ctrl_alu_src(ctrl_alu_src),
	.ctrl_reg_write(ctrl_reg_write)
);

reg_bank rb(.clk(clk),
	.instruction(instruction),
	.memory_read(memory_read),
	.ctrl_reg_write(ctrl_reg_write),
	.rb_read_enable(rb_read_enable),
	.rb_read1(rb_read1),
	.rb_read2(rb_read2)
);

alu-control alu-control(.clk(clk),
	.instruction(instruction),
	.ctrl_alu_op(ctrl_alu_op),
	.alu_control(alu_control)
);

imgen imgen(.clk(clk),
	.instruction(instruction),
	.imgen_out(imgen_out)
);

mlti mux1(.ctrl_alu_src(ctrl_alu_src),
	.rb_read2(rb_read2),
	.imgen_out(imgen_out),
	.mux1_out(mux1_out)
);

alu alu(.clk(clk),
	.alu_control(alu_control),
	.rb_read1(rb_read1),
	.mux1_out(mux1_out),
	.alu_zero(alu_zero),
	.alu_out(alu_out)
);

memory memory(.clk(clk),
	.alu_out(alu_out),
	.rb_read2(v),
	.ctrl_mem_write(ctrl_mem_write),
	.ctrl_mem_read(ctrl_mem_read),
	.memory_read(memory_read)
);

mlti mux2(.ctrl_mem_to_reg(ctrl_mem_to_reg),
	.memory_read(memory_read),
	.alu_out(alu_out),
	.mux2_out(mux2_out)
);

endmodule;