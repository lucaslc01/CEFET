library verilog;
use verilog.vl_types.all;
entity porta_exor is
    port(
        Y               : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic
    );
end porta_exor;
