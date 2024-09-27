LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE IEEE.NUMERIC_STD.all;
ENTITY ALUpart2 IS 
PORT (Clock: IN STD_LOGIC;
		A, B: IN UNSIGNED(7 DOWNTO 0);
		student_id: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 DOWNTO 0);
		neg: OUT STD_LOGIC;
		R1: OUT UNSIGNED(3 DOWNTO 0);
		R2: OUT UNSIGNED(3 DOWNTO 0));
		
END ALUpart2;

ARCHITECTURE calculation of ALUpart2 IS 
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL Reg4: UNSIGNED (0 TO 7);
BEGIN

Reg1 <= A;
Reg2 <= B;

PROCESS(Clock, OP)
BEGIN
IF (Clock = '1') THEN 
CASE OP IS
	WHEN "0000000000000001" =>--Increment A by 2
	neg<='0';
	Result<= Reg1+"00000010";
	
	WHEN "0000000000000010" =>--Shift B to right by two bits, input bit = 0 (SHR)

	neg<='0';
	Result<= Reg2(0)&Reg2(0)&Reg2(7)&Reg2(6)&Reg2(5)&Reg2(4)&Reg2(3)&Reg2(2);
	
	WHEN "0000000000000100" =>--Shift A to right by four bits, input bit = 1 (SHR)
	neg<='0';	
   Result<=Reg1(2)&Reg1(2)&Reg1(2)&Reg1(2)&Reg1(7)&Reg1(6)&Reg1(5)&Reg1(4);
	
	WHEN "0000000000001000" =>--Find the smaller value of A and B and produce the results ( Min(A,B) )
	neg<='0';
	if (Reg1 < Reg2) then
			Result <= Reg1;
	else
		Result <= Reg2;
	end if;
	
	WHEN "0000000000010000" =>--Rotate A to right by two bits (ROR)
	neg<='0';
	Result<= Reg1 ror 2;
	
	WHEN "0000000000100000" =>--Invert the bit-significance order of B
	            Result(0)<= Reg2(7);
					Result(1)<= Reg2(6);
					Result(2)<= Reg2(5);
					Result(3)<= Reg2(4);
					Result(4)<= Reg2(3);
					Result(5)<= Reg2(2);
					Result(6)<= Reg2(1);
					Result(7)<= Reg2(0);
					neg<='0';
	
	WHEN "0000000001000000" =>--Produce the result of XORing A and B 
	neg<='0';
	Result <= (Reg1 xor Reg2);
	
	
	WHEN "0000000010000000" =>--Produce the summation of A and B, then decrease it by 4
	Result <= (Reg1 + Reg2) - "00000100";
	if ((Reg1 + Reg2) < "00000100") then
					neg <= '1';
				else
					neg <= '0';
				end if;

	WHEN "0000000100000000" =>--Produce all high bits on the output
	neg<='0';
	Result <="11111111" ;
	
	WHEN OTHERS =>
	Result <= "--------";
	
	END CASE;
END IF;
END PROCESS;

R1 <= Result(7 DOWNTO 4);
R2 <= Result(3 DOWNTO 0);

END calculation;