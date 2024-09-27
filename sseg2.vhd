LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg2 IS
PORT ( 
bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
negnum : IN STD_LOGIC;
leds, ledss : OUT STD_LOGIC_VECTOR(0 TO 6));
END sseg2;

ARCHITECTURE Behavior OF sseg2 IS
BEGIN
PROCESS (bcd, negnum)

BEGIN
if (negnum ='0') then
	ledss <= ("0000000");
end if;
if (negnum = '1') then
	ledss <= ("0000001");
end if;

CASE bcd IS --abcdefg
WHEN "0000" =>leds <= ("0111011");
WHEN "0001" =>leds <= ("0010101");
WHEN OTHERS =>leds <= ("-------");

END CASE;

END PROCESS;
END Behavior;