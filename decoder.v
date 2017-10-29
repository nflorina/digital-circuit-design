module decoder(
	input[3:0] intrare_i,
	output reg[6:0] iesire_o

);

always@(*)
case (intrare_i)
0: iesire_o =  7'b1000000;
1: iesire_o =  7'b1111001;
2: iesire_o =  7'b0100100;
3: iesire_o =  7'b0110000;
4: iesire_o =  7'b0011001;
5: iesire_o =  7'b0010010;
6: iesire_o =  7'b0000010;
7: iesire_o =  7'b1111000;
8: iesire_o =  7'b0000000;
9: iesire_o =  7'b0010000;
default: iesire_o = 7'b0000110;
endcase

endmodule