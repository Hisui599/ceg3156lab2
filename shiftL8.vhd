-- Quartus II VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;

entity shiftL is
	port 
	(
		CLOCK_50		: in std_logic;
		enable	: in std_logic;
		--reset    : in std_logic;
		A	    : in std_logic_vector(7 downto 0);
		F	: out std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of shiftL is

	-- Build an array type for the shift register
	--type sr_length is array ((NUM_STAGES-1) downto 0) of std_logic;

	-- Declare the shift register signal
	signal sr: std_logic_vector(7 downto 0);

begin

	process (CLOCK_50)
	begin
		if (rising_edge(ClOCK_50)) then
			if (enable = '1') then

				-- Shift data by one stage; data from last stage is lost
				sr(7 downto 1) <= A(6 downto 0);

				-- Load new data into the first stage
				sr(0) <= '0';
			end if;
		end if;
	end process;

	-- Capture the data from the last stage, before it is lost
	F <= sr;

end rtl;
