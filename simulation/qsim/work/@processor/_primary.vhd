library verilog;
use verilog.vl_types.all;
entity Processor is
    port(
        ATEST           : out    vl_logic_vector(7 downto 0);
        Reset_A         : in     vl_logic;
        Clock           : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        BTEST           : out    vl_logic_vector(7 downto 0);
        Reset_B         : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        DECTEST         : out    vl_logic_vector(0 to 15);
        DEC_Enable      : in     vl_logic;
        data_in         : in     vl_logic;
        FMS_reset       : in     vl_logic;
        firstfourbits   : out    vl_logic_vector(0 to 6);
        lastfourbits    : out    vl_logic_vector(0 to 6);
        sign            : out    vl_logic_vector(0 to 6);
        student_id      : out    vl_logic_vector(0 to 6);
        TESTNUM1        : out    vl_logic_vector(3 downto 0);
        TESTNUM2        : out    vl_logic_vector(3 downto 0)
    );
end Processor;
