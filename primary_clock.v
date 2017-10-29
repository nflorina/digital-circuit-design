module primary_clock(
	input clk_i,
	input en_i,
	output reg count_signal_o

);
reg[31:0] count;
always@(posedge clk_i)begin
	if(en_i)begin
		count = count + 1;
		count_signal_o = count[18];
	end else 
		count_signal_o = 0;
end


endmodule