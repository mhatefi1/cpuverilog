module immediate_generator(clk, in, out);

input[31:0] in;
output reg [63:0] out;

input clk;

always@(posedge clk) begin
    out <= {{16{in[31]}}, in[31:0]};
end

endmodule;
