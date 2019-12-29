module cpu();

wire pc_data;
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
wire mux3_out;

wire alu_zero;
wire alu_out;

wire memory_read;

wire adder1_zero;
wire adder2_xero;
wire adder1_out;
wire adder2_out;

reg [3:0] add_command = 4'b0010;

initial begin
	pc_reset = 1;
	#10;
	pc_reset = 0;
  end

initial begin
	ins_write_enable = 1;
	ins_write_data = 0; //todo
end

clock my_clock(clk);
pc my_pc(.data(pc_data), .clk(clk), .reset(pc_reset), .out(pc));
instruction_memory im(.clk(clk),
	.address(pc),
	.write_data(ins_write_data),
	.write_en(ins_write_enable),
	.read_en(ins_read_enable),
	.read_data(instruction)
);

control ctrl(.clk(clk),
	.instruction(instruction),
	.branch(ctrl_branch),
	.mem_read(ctrl_v),
	.mem_to_reg(ctrl_mem_to_reg),
	.alu_op(ctrl_alu_op),
	.mem_write(ctrl_mem_write),
	.alu_src(ctrl_alu_src),
	.reg_write(ctrl_reg_write)
);

reg_bank rb(.clk(clk),
	.instruction(instruction),
	.write_data(memory_read),
	.write_en(ctrl_reg_write),
	.read_en(rb_read_enable),
	.read_data1(rb_read1),
	.read_data2(rb_read2)
);

alu__control alu__control(.clk(clk),
	.instruction(instruction),
	.op(ctrl_alu_op),
	.out(alu_control)
);

imgen imgen(.clk(clk),
	.in(instruction),
	.out(imgen_out)
);

mlti mux1(.select(ctrl_alu_src),
	.a(rb_read2),
	.b(imgen_out),
	.out(mux1_out)
);

alu alu(.clk(clk),
	.select(alu_control),
	.input1(rb_read1),
	.input2(mux1_out),
	.zero(alu_zero),
	.result(alu_out)
);

memory memory(.clk(clk),
	.address(alu_out),
	.write_data(v),
	.write_en(ctrl_mem_write),
	.read_en(ctrl_mem_read),
	.read_data(memory_read)
);

mlti mux2(.select(ctrl_mem_to_reg),
	.a(memory_read),
	.b(alu_out),
	.out(mux2_out)
);

alu adder1(.clk(clk),
	.select(4'b0010),
	.input1(pc),
	.input2(4),
	.zero(adder1_zero),
	.result(adder1_out)
);

alu adder2(.clk(clk),
	.select(4'b0010),
	.input1(pc),
	.input2({imgen_out<<1, 1'b0}),
	.zero(adder2_zero),
	.result(adder2_out)
);

mlti mux3(.select(ctrl_branch&alu_zero),
	.a(adder1_out),
	.b(adder2_out),
	.out(pc_data)
);

endmodule;