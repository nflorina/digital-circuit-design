typedef enum {load, reset, start} command_tk;

class command;
  command_tk command_type;
  int id;
  int delay;
  bit [3:0] init_value[4];
  rand bit inc_dec;
 
  constraint Cdelay { delay inside {[1:9999]}; }
  constraint Cinit_value { foreach (init_value[i]) init_value[i] inside {[0:9]}; }
endclass


class input_dut;
  logic increment, reset, startstop, load;
  logic [1:0] digit_i;
  logic [3:0] value;
endclass
 
 
 
class output_dut;
    logic [6:0] cifra0, cifra1, cifra2, cifra3;
endclass


typedef mailbox #(command) command_chanel;
typedef mailbox #(input_dut) input_chanel;
typedef mailbox #(output_dut) output_chanel;


