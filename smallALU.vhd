library  ieee;
use  ieee.std_logic_1164.all;

entity smallAlu is 
port (
		selec :in std_logic_vector(2 downto 0);
		ValA, ValB: in std_logic_vector(7 downto 0);
		ValO : out std_logic_vector(7 downto 0)

	);
end smallAlu;

architecture rtl of smallAlu is
--AND OR SUB ADD SLT

--ADDER Component
component eightBitAdder is
	port (
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Sum			: OUT	STD_LOGIC_VECTOR(7 downto 0);
		carry6, carry7 : OUT STD_LOGIC
	);
end component eightBitAdder;

--Subtractor
component eightBitSubtractor is
	port (
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Sum			: OUT	STD_LOGIC_VECTOR(7 downto 0)
	);
end component eightBitSubtractor;

--AND
component eightBitAND is
	port (
		ValA,ValB: in std_logic_vector(7 downto 0);
		ValO: out std_logic_vector(7 downto 0)
	);
end component eightBitAND;
--OR 
 component eightBitOR is
	port (
		ValA,ValB: in std_logic_vector(7 downto 0);
		ValO: out std_logic_vector(7 downto 0)
	);
end component eightBitOR;
--LST
component eightBitSLT is
	port (
		ValA,ValB: in std_logic_vector(7 downto 0);
		ValO: out std_logic_vector(7 downto 0)
	);
end component eightBitSLT;

component mux8x3 is
	port (
		a,b,c,d,e,f,g,h : in std_logic_vector(7 downto 0);
		selec: in std_logic_vector(2 downto 0);
		m : out std_logic_vector(7 downto 0)
	);
end component mux8x3;
signal inSigA,inSigB,inMuxA,inMuxB,inMuxC,inMuxD,inMuxE,outMuxA,inMuxF: std_logic_vector(7 downto 0);
signal selectors : std_logic_vector(2 downto 0);
begin
selectors <= selec;
inSigA <= ValA ; inSigB <= ValB;


 sAND: eightBitAND port map(inSigA,inSigB,inMuxA);
 sOR: eightBitOR port map(inSigA,inSigB,inMuxB);
 sADD: eightBitAdder port map(inSigA,inSigB,inMuxC);
 sSUB: eightBitSubtractor port map(inSigA,inSigB,inMuxD);
 sSLT: eightBitSLT port map(inSigA,inSigB,inMuxF);
 mux: mux8x3 port map(inMuxA,inMuxB,inMuXC,inMuxD,inMuxE,"00000000","00000000","00000000",selectors,outMuxA);
 ValO <= outMuxA; 
		
end architecture rtl;