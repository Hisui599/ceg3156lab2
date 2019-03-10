library ieee;
use ieee.std_logic_1164.all;

entity eightBitSLT is
	port (
			valA, valB : in std_logic_vector (7 downto 0);
			valO: out std_logic_vector(7 downto 0)
		);
end eightBitSLT;

architecture rtl of eightBitSLT is
begin
process(valB,valA)
begin
	if (valB>valA) then 
	valO <= "11111111";
	else
	valO <= "00000000";
	
	
end if;
end process;
end architecture;