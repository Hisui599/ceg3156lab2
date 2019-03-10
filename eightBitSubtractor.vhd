library IEEE;
use IEEE.std_logic_1164.all;

entity eightBitSubtractor is
PORT(
i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Sum			: OUT	STD_LOGIC_VECTOR(7 downto 0)
	
);

end eightBitSubtractor;

architecture rtlButNotReally of eightBitSubtractor is

signal numAs,numBs,numA,numB, numOuts,numOuts1: std_logic_vector(7 downto 0 );
component eightBitComplemenv2t
port (
numA: in std_logic_vector(7 downto 0);
numOut: out std_logic_vector(7 downto 0)
);

end component;
component eightBitAdder 
PORT(
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Sum			: OUT	STD_LOGIC_VECTOR(7 downto 0));
end component;


begin 
numA<=i_ai;
numB <=i_bi;
compa: eightBitComplemenv2t  port map  (numB, numBs);
subtr1: eightBitAdder port map (numA,numBs,numOuts);
subtr: eightBitAdder  port map (numOuts, "00000001", numOuts);

o_sum <= numOuts1;
end rtlButNotReally;
