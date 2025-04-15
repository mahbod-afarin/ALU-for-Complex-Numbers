library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        \out\           : out    vl_logic_vector(9 downto 0);
        valid           : out    vl_logic;
        opcode          : in     vl_logic_vector(1 downto 0);
        op1             : in     vl_logic_vector(4 downto 0);
        op2             : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end alu;
