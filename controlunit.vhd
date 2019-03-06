LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controlUnit IS


PORT ( 	
	Op:IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp1, ALUOp0 :OUT STD_LOGIC);
	
END controlUnit;
ARCHITECTURE Behavior OF controlUnit IS

	Signal RFormat, lw, sw, beq: STD_LOGIC;	

BEGIN

	RFormat <= (not(Op(1))) and (not(Op(2))) and (not(Op(3))) and (not(Op(4))) and (not (Op(5)));
	lw <= Op(5) and (not(Op(4))) and (not(Op(3))) and (not(Op(2))) and Op(1) and Op(0);
	sw <= Op(5) and (not(Op(4))) and Op(3) and (not(Op(2))) and Op(1) and Op(0);
	beq <= (not(Op(5))) and (not(Op(4))) and (not(Op(3))) and Op(2) and (not(Op(1))) and (not(Op(0)));
	Jump<=(not(Op(5))) and (not(Op(4))) and (not(Op(3))) and (not(Op(2))) and Op(1) and (not(Op(0)));
	RegDst <= RFormat; 
	AlUSrc <= lw or sw;
	MemtoReg <= lw;
	RegWrite <= RFormat or lw;
	MemRead <= lw;
	MemWrite <= sw; 
	Branch <= beq;
	ALUOp1 <= RFormat;
	ALUOp0 <= beq;

END Behavior;