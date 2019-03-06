library ieee;
use ieee.std_logic_1164.all;

entity mux3x8 is
	port (
		a, b, c, d, e, f: in std_logic_vector(7 downto 0);
		s : in std_logic_vector(2 downto 0);
		y : out std_logic_vector(7 downto 0));
end mux3x8;

architecture arch_mux3x8 of mux3x8 is
	begin
	
	with s select
		y <= a when "000",
			  b when "001",
		     c when "010",
		     d when "011",
		     e when "100",
		     f when others;
end arch_mux3x8;