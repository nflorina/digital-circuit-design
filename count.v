module count(
	input clk_i,
	output reg[31:0] count_o
);

always @(posedge clk_i)
begin
	count_o <= 2;// count_o + 1;
end
endmodule