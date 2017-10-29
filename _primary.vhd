library verilog;
use verilog.vl_types.all;
entity count is
    port(
        clk_i           : in     vl_logic;
        count_o         : out    vl_logic_vector(31 downto 0)
    );
end count;
