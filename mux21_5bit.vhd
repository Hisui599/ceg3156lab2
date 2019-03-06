LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux21_5bit IS
PORT (A, B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		s : IN STD_LOGIC;
		R : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
end mux21_5bit;

ARCHITECTURE arch_mux21_5bit OF mux21_5bit IS

BEGIN
	process(s)
	BEGIN
		if(s = '0') then
			R <= A;
		else
			R <= B;
		end if;
	end process;
end arch_mux21_5bit;