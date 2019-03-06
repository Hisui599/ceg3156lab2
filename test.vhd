LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity test is
port(
	clock : in std_logic;
	output : out std_logic_vector(31 downto 0));
end test;

architecture arch_test of test is

	component ram IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END component;
	
	component instructionmemory is
	port(
		address : in std_logic_vector(7 downto 0);
		instruction : out std_logic_vector(31 downto 0));
	end component;
	
	begin
	
	--a : ram port map ("00000000", clock, "11000000", '0', output);
	b : instructionmemory port map ("00000000", output);
end arch_test;