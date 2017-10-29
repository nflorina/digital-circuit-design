library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk_i           : in     vl_logic;
        start_stop_button_i: in     vl_logic;
        reset_button_i  : in     vl_logic;
        en_o            : out    vl_logic;
        reset_o         : out    vl_logic
    );
end controller;
