module controller(
	input clk_i,
	input start_stop_button_i,
	input reset_button_i,

	output reg en_o,
	output reg reset_o
);
reg prev_pressed;
always@(posedge clk_i)begin
	if(!reset_button_i)begin
		reset_o <= 1;
		en_o <= 0;	
	end else	begin
		reset_o <= 0;
		if(!start_stop_button_i)begin
			if(!prev_pressed)begin
				en_o <= !en_o;
				prev_pressed <= 1;
			end
		end else begin
			prev_pressed <= 0;
		end
	end
end


endmodule