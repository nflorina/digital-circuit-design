module top_tb(
  //logic clock;
);

logic clock;

int_out iesire();
int_in intrare();
top dut(.ck_i(clock), .inc_i(intrare.increment), .rst_i(intrare.reset), .startstop_i(intrare.startstop), .digit_i(intrare.digit_i), .wenable_i(intrare.load), .wvalue_i(intrare.value), .dig0_o(iesire.cifra0), .dig1_o(iesire.cifra1), .dig2_o(iesire.cifra2), .dig3_o(iesire.cifra3));
test my_test();

initial
begin
  clock = 0;
  #10ms;
  
end


always
  begin
    
    #10ns clock= ~clock;
  end
  
endmodule