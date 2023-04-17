library verilog;
use verilog.vl_types.all;
entity compriority is
    port(
        prio_adder_cmd  : out    vl_logic_vector(0 to 3);
        prio_adder_tag  : out    vl_logic_vector(0 to 3);
        prio_adder_out_vld: out    vl_logic;
        prio_adder_data1: out    vl_logic_vector(0 to 31);
        prio_adder_data2: out    vl_logic_vector(0 to 31);
        prio_shift_cmd  : out    vl_logic_vector(0 to 3);
        prio_shift_tag  : out    vl_logic_vector(0 to 3);
        prio_shift_out_vld: out    vl_logic;
        prio_shift_data1: out    vl_logic_vector(0 to 31);
        prio_shift_data2: out    vl_logic_vector(0 to 31);
        port1_invalid_op: out    vl_logic;
        port1_invalid_tag: out    vl_logic_vector(0 to 1);
        port2_invalid_op: out    vl_logic;
        port2_invalid_tag: out    vl_logic_vector(0 to 1);
        port3_invalid_op: out    vl_logic;
        port3_invalid_tag: out    vl_logic_vector(0 to 1);
        port4_invalid_op: out    vl_logic;
        port4_invalid_tag: out    vl_logic_vector(0 to 1);
        scan_out        : out    vl_logic;
        hold1_data1     : in     vl_logic_vector(0 to 31);
        hold1_data2     : in     vl_logic_vector(0 to 31);
        hold2_data1     : in     vl_logic_vector(0 to 31);
        hold2_data2     : in     vl_logic_vector(0 to 31);
        hold3_data1     : in     vl_logic_vector(0 to 31);
        hold3_data2     : in     vl_logic_vector(0 to 31);
        hold4_data1     : in     vl_logic_vector(0 to 31);
        hold4_data2     : in     vl_logic_vector(0 to 31);
        hold1_tag       : in     vl_logic_vector(0 to 1);
        hold2_tag       : in     vl_logic_vector(0 to 1);
        hold3_tag       : in     vl_logic_vector(0 to 1);
        hold4_tag       : in     vl_logic_vector(0 to 1);
        hold1_cmd       : in     vl_logic_vector(0 to 3);
        hold2_cmd       : in     vl_logic_vector(0 to 3);
        hold3_cmd       : in     vl_logic_vector(0 to 3);
        hold4_cmd       : in     vl_logic_vector(0 to 3);
        reset           : in     vl_logic;
        scan_in         : in     vl_logic;
        a_clk           : in     vl_logic;
        b_clk           : in     vl_logic;
        c_clk           : in     vl_logic
    );
end compriority;
