LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ALU1bit IS

PORT (

	A, B, Cin, LTN:IN STD_LOGIC;
	ALUoperation:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALUresult:OUT STD_LOGIC;
	Cout, Set:OUT STD_LOGIC);
	
end ALU1bit;

ARCHITECTURE Behavior OF ALU1bit IS

	SIGNAL X,Y,S,O:STD_LOGIC;
	
	component fullAdder1Bit
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		Ci :  IN  STD_LOGIC;
		S :  OUT  STD_LOGIC;
		Co :  OUT  STD_LOGIC
	);
END component;
	
BEGIN
	
	process(ALUoperation)
	Begin
	
	case ALUoperation is
		when "000" => ALUresult <= A and B;
		when "001" => ALUresult <= A or B;
		when "010" => X<=A; Y<=B; ALUResult<=S;
		when "110" => X<=A; Y<=NOT(B); ALUResult<=S;
		when "111" => X<=A; Y<=NOT(B); ALUResult<=LTN; Set<=S;
		when others =>O<='1';
	end case;
	end process;
	
	adder: fullAdder1Bit port map(X, Y, Cin, S, Cout);
	
	
	
	

end Behavior;
		