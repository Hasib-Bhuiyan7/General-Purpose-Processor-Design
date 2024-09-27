library verilog;
use verilog.vl_types.all;
entity Processor_vlg_check_tst is
    port(
        ATEST           : in     vl_logic_vector(7 downto 0);
        BTEST           : in     vl_logic_vector(7 downto 0);
        DECTEST         : in     vl_logic_vector(0 to 15);
        firstfourbits   : in     vl_logic_vector(0 to 6);
        lastfourbits    : in     vl_logic_vector(0 to 6);
        sign            : in     vl_logic_vector(0 to 6);
        student_id      : in     vl_logic_vector(0 to 6);
        TESTNUM1        : in     vl_logic_vector(3 downto 0);
        TESTNUM2        : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end Processor_vlg_check_tst;
