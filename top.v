module top(
	input ck_i,
	input inc_i,
	input rst_i,
	input startstop_i,
				
	input [1:0]digit_i,
	input [3:0]wvalue_i,
	
	input wenable_i,
	
	output[6:0] dig0_o,
	output[6:0] dig1_o,
	output[6:0] dig2_o,
	output[6:0] dig3_o

);
wire reset_s;

wire en_p_clk;
controller ctrl(.clk_i(ck_i), .start_stop_button_i(startstop_i), .reset_button_i(rst_i), .reset_o(reset_s), .en_o(en_p_clk));

wire m_clock_en_s;
primary_clock m_clock(.clk_i(ck_i), .count_signal_o(m_clock_en_s), .en_i(en_p_clk));

reg s_clk_1_set_value;
reg s_clk_2_set_value;
reg s_clk_3_set_value;
reg s_clk_4_set_value;
reg [3:0] s_clk_1_value;
reg [3:0] s_clk_2_value;
reg [3:0] s_clk_3_value;
reg [3:0] s_clk_4_value;

always@(wenable_i, digit_i)begin
	if(!wenable_i) begin
		case (digit_i)
		0: begin
			s_clk_1_set_value = 1;
			s_clk_2_set_value = 0;
			s_clk_3_set_value = 0;
			s_clk_4_set_value = 0;
			s_clk_1_value = wvalue_i;
		end 
		1:begin
			s_clk_1_set_value = 0;
			s_clk_2_set_value = 1;
			s_clk_3_set_value = 0;
			s_clk_4_set_value = 0;
			s_clk_2_value = wvalue_i;
		end
		2:begin
			s_clk_1_set_value = 0;
			s_clk_2_set_value = 0;
			s_clk_3_set_value = 1;
			s_clk_4_set_value = 0;
			s_clk_3_value = wvalue_i;
		end
		3:begin
			s_clk_1_set_value = 0;
			s_clk_2_set_value = 0;
			s_clk_3_set_value = 0;
			s_clk_4_set_value = 1;
			s_clk_4_value = wvalue_i;
		end
		endcase
	end else begin
		s_clk_1_set_value = 0;
		s_clk_2_set_value = 0;
		s_clk_3_set_value = 0;
		s_clk_4_set_value = 0;
	end
end


wire s_clock_1_en_s;
wire[3:0] s_clock_1_dec_s;
smart_clock s_clock_1(.clk_i(ck_i), .reset_i(reset_s), .count(s_clock_1_dec_s), .en_i(m_clock_en_s), .en_o(s_clock_1_en_s), .dir_i(inc_i),
		.set_value_i(s_clk_1_set_value), .value_i(s_clk_1_value));
decoder dec_1(.intrare_i(s_clock_1_dec_s), .iesire_o(dig0_o));



wire s_clock_2_en_s;
wire[3:0] s_clock_2_dec_s;
smart_clock s_clock_2(.clk_i(ck_i), .reset_i(reset_s), .count(s_clock_2_dec_s), .en_i(s_clock_1_en_s), .en_o(s_clock_2_en_s), .dir_i(inc_i),
		.set_value_i(s_clk_2_set_value), .value_i(s_clk_2_value));
decoder dec_2(.intrare_i(s_clock_2_dec_s), .iesire_o(dig1_o));


wire s_clock_3_en_s;
wire[3:0] s_clock_3_dec_s;
smart_clock s_clock_3(.clk_i(ck_i), .reset_i(reset_s), .count(s_clock_3_dec_s), .en_i(s_clock_2_en_s), .en_o(s_clock_3_en_s), .dir_i(inc_i),
		.set_value_i(s_clk_3_set_value), .value_i(s_clk_3_value));
decoder dec_3(.intrare_i(s_clock_3_dec_s), .iesire_o(dig2_o));


wire s_clock_4_en_s;
wire[3:0] s_clock_4_dec_s;
smart_clock s_clock_4(.clk_i(ck_i), .reset_i(reset_s), .count(s_clock_4_dec_s), .en_i(s_clock_3_en_s), .en_o(s_clock_4_en_s), .dir_i(inc_i),
		.set_value_i(s_clk_4_set_value), .value_i(s_clk_4_value));
decoder dec_4(.intrare_i(s_clock_4_dec_s), .iesire_o(dig3_o));

endmodule