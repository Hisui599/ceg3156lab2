LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ALUcontrol IS

PORT (
	
	f:IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALUop:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Operation:OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
	
end ALUcontrol;

ARCHITECTURE Behavior OF ALUcontrol IS
	
	Signal op0, op1, op2: STD_LOGIC;
	
BEGIN
	
	op2<=ALUop(0) OR (ALUop(1) AND f(1));
	op1<=(NOT(ALUop(0))) OR (NOT(f(2)));
	op0<=ALUop(0) AND (f(3) OR f(0));


	Operation(2)<=op2;
	Operation(1)<=op1;
	Operation(0)<=op0;
	
end Behavior;
		