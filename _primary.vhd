library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        intrare_i       : in     vl_logic_vector(3 downto 0);
        iesire_o        : out    vl_logic_vector(6 downto 0)
    );
end decoder;
