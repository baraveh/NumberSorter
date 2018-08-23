library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contcomp_tb is
end entity;

architecture test of contcomp_tb is

component ContComp is
	port(CLK                                : in  std_logic; --Clock, active high
	     RSTn                               : in  std_logic; --Async. Reset, active low
	     load                               : out std_logic_vector(5 downto 0);
	     output                             : out std_logic;
	     selA, selB, selC, selD, selE, selF : out std_logic_vector(2 downto 0);
	     selMAX, selMin                     : out std_logic_vector(2 downto 0)
	    );
end component;	

signal clk,output : std_logic;
signal load  		   : std_logic_vector (5 downto 0);
signal selA, selB, selC, selD, selE, selF : std_logic_vector( 2 downto 0);
signal  selMAX, selMin                     : std_logic_vector(2 downto 0);
signal rstn : std_logic :='1';
	
begin

u0: ContComp port map (CLK,RSTn,load,output,selA, selB, selC, selD, selE, selF,selMAX, selMin);

process 
	begin 
	clk<='1';
	wait for 5 ns;
	clk<='0';
	wait for 5 ns;

end process;

	
	
	
end architecture ;
	