LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
PORT (Clock : IN STD_LOGIC ; --input clock signal
A ,B : IN UNSIGNED(7 DOWNTO 0); --8-bit inputs from latches A and B
Student_id: IN UNSIGNED(3 DOWNTO 0); --4-bit student id from FSM
OP: IN UNSIGNED(15 DOWNTO 0); --16-bit selector for Operation from Decoder
Neg: OUT STD_LOGIC; --is the result negative? Set -ve bit output
R1: OUT UNSIGNED(3 DOWNTO 0);--lower 4-bits of 8-bit Result Output
R2: OUT UNSIGNED(3 DOWNTO 0));--higher 4-bits of 8-bit Result Output
END ALU;
ARCHITECTURE Behavior OF ALU IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);

BEGIN
	Reg1 <= A; --temporarily store A in Reg1 local variable
	Reg2 <= B; --temporarily store B in Reg2 local variable
	
	PROCESS (Clock,OP,A,B)
	BEGIN
	IF (Clock = '1') THEN
		CASE OP IS
			WHEN "0000000000000001" => --Addition for Reg1 and Reg2
				neg <= '0';
				Result <= Reg2 + Reg1;
			WHEN "0000000000000010"  => --Subtraction for Reg1 and Reg2
				if (Reg1 < Reg2) then
					neg <= '1';
					Result <= (Reg2 - Reg1);--'Neg' bit set as when required
				else
					neg <= '0';
					Result <= (Reg1 - Reg2);
				end if;
			WHEN "0000000000000100" =>--Inverse
				neg <= '0';
				Result <= NOT(Reg1);
			WHEN "0000000000001000" =>--NAND
				neg <= '0';
				Result <= (Reg1 NAND Reg2);
			WHEN "0000000000010000" =>--NOR
				neg <= '0';
				Result <= (Reg1 NOR Reg2);
			WHEN "0000000000100000" =>--AND
				neg <= '0';
				Result <= (Reg1 AND Reg2);
			WHEN "0000000001000000" =>--XOR
				neg <= '0';
				Result <= (Reg1 XOR Reg2);
			WHEN "0000000010000000" =>--OR
				neg <= '0';
				Result <= (Reg1 OR Reg2);
			WHEN "0000000100000000" =>--XNOR
				neg <= '0';
				Result <= (Reg1 XNOR Reg2);
			WHEN OTHERS =>-- Don't care, do nothing
			END CASE;
		END IF;
	END PROCESS;
	
	R2 <= Result(3 DOWNTO 0); --Splits 8-bit into 4-bit
	R1 <= Result(7 DOWNTO 4);
END Behavior;