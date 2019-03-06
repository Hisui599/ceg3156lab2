LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity cpu is
port(
	gclock, greset : in std_logic;
	valueselect : in std_logic_vector(2 downto 0));
end cpu;

architecture arch_cpu of cpu is
	begin
end arch_cpu;