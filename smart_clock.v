module smart_clock(
	input en_i,
	input clk_i,
	input reset_i,
	input dir_i,
	
	input set_value_i,
	input [3:0] value_i,
	
	output reg en_o,
	output reg[3:0] count
);

reg prev_en;
always@(posedge clk_i)begin
	if(reset_i)begin
		count = 0;
	end else if(set_value_i)begin
				count = value_i;
	end else begin
		if(en_i)begin
			if(!prev_en)begin
				prev_en = 1;
				if(dir_i)begin
					count = count + 1;
					if(count > 9)begin
						count = 0;
						en_o = 1;
					end else begin
						en_o = 0;
					end
				end else begin
					count = count - 1;
					if(count > 9)begin
						count = 9;
						en_o = 1;
					end else begin
						en_o = 0;
					end
				end
			end
		end else begin
			prev_en = 0;
		end
	end
end



endmodule