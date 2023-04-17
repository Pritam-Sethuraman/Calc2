library verilog;
use verilog.vl_types.all;
entity stim_Gen_ver is
    port(
        req1_cmd_in     : out    vl_logic_vector(3 downto 0);
        req1_data_in    : out    vl_logic_vector(31 downto 0);
        req1_tag_in     : out    vl_logic_vector(1 downto 0);
        req2_cmd_in     : out    vl_logic_vector(3 downto 0);
        req2_data_in    : out    vl_logic_vector(31 downto 0);
        req2_tag_in     : out    vl_logic_vector(1 downto 0);
        req3_cmd_in     : out    vl_logic_vector(3 downto 0);
        req3_data_in    : out    vl_logic_vector(31 downto 0);
        req3_tag_in     : out    vl_logic_vector(1 downto 0);
        req4_cmd_in     : out    vl_logic_vector(3 downto 0);
        req4_data_in    : out    vl_logic_vector(31 downto 0);
        req4_tag_in     : out    vl_logic_vector(1 downto 0)
    );
end stim_Gen_ver;
