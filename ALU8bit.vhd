LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ALU8bit IS

PORT (

	A, B:IN STD_LOGIC_VECTOR(7 downto 0);
	ALUoperation:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALUout:OUT STD_LOGIC_VECTOR(7 downto 0);
	Zero:OUT STD_LOGIC);
	
end ALU8bit;

ARCHITECTURE Behavior OF ALU8bit IS

	SIGNAL c, ALUresult:STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Cin, LTN, set:STD_LOGIC;
BEGIN
	
	Cin <= (ALUoperation(2) AND ALUoperation(1)) or (ALUoperation(2) AND ALUoperation(1));

	alu0: ENTITY work.ALU1bit port map(A(0), B(0), Cin, set, ALUoperation, ALUresult(0), c(0));
	alu1: ENTITY work.ALU1bit port map(A(1), B(1), c(0), '0', ALUoperation, ALUresult(1), c(1));
	alu2: ENTITY work.ALU1bit port map(A(2), B(2), c(1), '0', ALUoperation, ALUresult(2), c(2));
	alu3: ENTITY work.ALU1bit port map(A(3), B(3), c(2), '0', ALUoperation, ALUresult(3), c(3));
	alu4: ENTITY work.ALU1bit port map(A(4), B(4), c(3), '0', ALUoperation, ALUresult(4), c(4));
	alu5: ENTITY work.ALU1bit port map(A(5), B(5), c(4), '0', ALUoperation, ALUresult(5), c(5));
	alu6: ENTITY work.ALU1bit port map(A(6), B(6), c(5), '0', ALUoperation, ALUresult(6), c(6));
	alu7: ENTITY work.ALU1bit port map(A(7), B(7), c(6), '0', ALUoperation, ALUresult(7), c(7),set);
	
	Zero <= NOT(ALUresult(7) OR ALUresult(6) OR ALUresult(5) OR ALUresult(4) OR ALUresult(3) OR ALUresult(2) OR ALUresult(1) OR ALUresult(0));
	ALUout<=ALUresult;
	
	

end Behavior;
		