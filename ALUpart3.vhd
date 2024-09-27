LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE IEEE.NUMERIC_STD.all;
ENTITY ALUpart3 IS 
PORT (Clock: IN STD_LOGIC;
		A, B: IN UNSIGNED(7 DOWNTO 0);
		student_id: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 DOWNTO 0);
		neg: OUT STD_LOGIC;
		R1: OUT UNSIGNED(3 DOWNTO 0);
		R2: OUT UNSIGNED(3 DOWNTO 0));
END ALUpart3;	
ARCHITECTURE calculation of ALUpart3 IS 
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL Reg4: UNSIGNED (0 TO 7);
BEGIN

Reg1 <= A;
Reg2 <= B;

PROCESS(Clock, OP)
BEGIN
IF (Clock = '1') THEN 
CASE OP IS
	WHEN "0000000000000001" => --Even
	neg<='0';
	Result<="00010001";
	
	WHEN "0000000000000010" =>--Odd
	neg<='0';
	Result<="00000000";
	
	
	WHEN "0000000000000100" =>--Even
	neg<='0';
	Result<="00010001";
	
	WHEN "0000000000001000" =>--Odd
	neg<='0';
	Result<="00000000";
	
	WHEN "0000000000010000" =>--Even
	neg<='0';
	Result<="00010001";
	
	
	WHEN "0000000000100000" =>--Odd
	neg<='0';
	Result<="00000000";
	
	WHEN "0000000001000000" =>--Even
	neg<='0';
	Result<="00010001";
	
	
	WHEN "0000000010000000" =>--Odd
	neg<='0';
	Result<="00000000";
	
	WHEN "0000000100000000" =>--Even
	neg<='0';
	Result<="00010001";
	
	
	WHEN OTHERS =>
	Result <= "--------";
	
	END CASE;
END IF;
END PROCESS;

R2 <= Result(3 downto 0);
R1 <= Result(7 downto 4);

END calculation;