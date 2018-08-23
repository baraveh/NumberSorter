library ieee;
use IEEE.std_logic_1164.all;

entity MUX6 is
  generic (N : integer := 4);
  port (
        p1 : in  std_logic_vector (N-1 downto 0);-- first number
        p2 : in  std_logic_vector (N-1 downto 0);-- Second number
        p3 : in  std_logic_vector (N-1 downto 0);-- third number
        p4 : in  std_logic_vector (N-1 downto 0);-- fourth number
        p5 : in  std_logic_vector (N-1 downto 0);-- fourth number
        p6 : in  std_logic_vector (N-1 downto 0);-- fourth number
 		Sel : in  std_logic_vector (2 downto 0);-- mux selection
        output : out std_logic_vector (N-1 downto 0)
    );
end entity;
architecture mux_arch of MUX6 is

begin

with Sel select

output <= 
		p1 when "000",
		p2 when "001",
		p3 when "010",
		p4 when "011",
		p5 when	"100",
		p6 when others;
end mux_arch;
---------------------------------------------
----------------------------------------------
library ieee;
use IEEE.std_logic_1164.all;
entity DFF is
	generic (N : integer:= 4);
	port(CLK  : in  std_logic;          --Clock, active high
	     RSTn : in  std_logic;          --Async. Reset, active low
	     En   : in  std_logic;
	     D    : in  std_logic_vector (N-1 downto 0);
	     Q    : out std_logic_vector (N-1 downto 0)
	    );
end entity;

architecture behavior of DFF is

begin

	process(CLK, RSTn)
	begin
		if RSTn = '0' then
			
				Q<=(others => '0');
			
		elsif clk = '1' and clk'event then
			if (En = '1') then
			
				Q <= D;
			
			end if;
		end if;
	end process;

end behavior;
--------------end DFF----------------------------------

-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Top is
  generic (N : integer := 4);
  port (CLK : in std_logic; --Clock, active high
        RSTn : in std_logic; --Async. Reset, active low
        A : in  std_logic_vector (N-1 downto 0);-- first number
        B : in  std_logic_vector (N-1 downto 0);-- second number
        C : in  std_logic_vector (N-1 downto 0);-- third number
        D : in  std_logic_vector (N-1 downto 0);-- fourth number
        E : in  std_logic_vector (N-1 downto 0);-- fifth number
        F : in  std_logic_vector (N-1 downto 0);-- sixth number

        First : out std_logic_vector (N-1 downto 0);-- smallest number
        Second : out std_logic_vector (N-1 downto 0);-- mid1 number
        Third : out std_logic_vector (N-1 downto 0);-- mid2 number
        Fourth : out std_logic_vector (N-1 downto 0); -- largest number
	   Fifth : out std_logic_vector (N-1 downto 0); -- largest number
	   Sixth : out std_logic_vector (N-1 downto 0) -- largest number

    );
end entity;

architecture behavior of Top is

component Compare2 is
  generic (N : integer := 4);
    port (
        A : in  std_logic_vector (N-1 downto 0);-- first number
        B : in  std_logic_vector (N-1 downto 0);-- Second number
        Max : out std_logic_vector (N-1 downto 0);-- Larger number
        Min : out std_logic_vector (N-1 downto 0) -- Smaller number
    );
end component;

component ContComp is
	generic (N : integer :=4);
	port(CLK                                : in  std_logic; --Clock, active high
	     RSTn                               : in  std_logic; --Async. Reset, active low
	     load                               : out std_logic_vector(5 downto 0);
	     output                             : out std_logic_vector (N-1 downto 0);
	     selA, selB, selC, selD, selE, selF : out std_logic_vector(2 downto 0);
	     selMAX, selMin                     : out std_logic_vector(2 downto 0)
	    );
end component;

component DFF is
generic (N : integer := 4);
port(CLK  : in  std_logic;          --Clock, active high
	     RSTn : in  std_logic;          --Async. Reset, active low
	     En   : in  std_logic;
	     D    : in  std_logic_vector (N-1 downto 0);
	     Q    : out std_logic_vector (N-1 downto 0)
	    );
end component;

component MUX6 is
  generic (N : integer := 4);
  port (
        p1 : in  std_logic_vector (N-1 downto 0);-- first number
        p2 : in  std_logic_vector (N-1 downto 0);-- Second number
        p3 : in  std_logic_vector (N-1 downto 0);-- third number
        p4 : in  std_logic_vector (N-1 downto 0);-- fourth number
        p5 : in  std_logic_vector (N-1 downto 0);-- fourth number
        p6 : in  std_logic_vector (N-1 downto 0);-- fourth number
 		Sel : in  std_logic_vector (2 downto 0);-- mux selection
        output : out std_logic_vector (N-1 downto 0)
    );
end component;

signal A1,A2,A3,A4,A5,A6				   : std_logic_vector (N-1 downto 0);
signal Aco2,Bco2,max_from_co2,min_from_co2 : std_logic_vector(N-1 downto 0);
signal output							   : std_logic_vector (N-1 downto 0);
signal load								   : std_logic_vector(5 downto 0);
signal selA, selB, selC, selD, selE, selF  : std_logic_vector(2 downto 0);
signal selMAX, selMin  					   : std_logic_vector(2 downto 0);
signal mux_to_reg_1,mux_to_reg_2,mux_to_reg_3,mux_to_reg_4,mux_to_reg_5,mux_to_reg_6 :
		std_logic_vector(N-1 downto 0);
-----------------------------------------------------------------

-----------------------------------------------------------------
begin
	
		first<=A1;
		second<=A2;
		third<=A3;
		Fourth<=A4;
		Fifth<=A5;
		Sixth<=A6;

 
 U0 : Compare2 generic map (N)
      port map (Aco2,Bco2,max_from_co2,min_from_co2);
 U1 : ContComp generic map (N)
      port map (CLK,RSTn,load,output,selA, selB, selC, selD, selE, selF,selMAX, selMin );
      
      
 M0 : MUX6
	 port map(A,max_from_co2,"0000","0000","0000","0000",selA,mux_to_reg_1);
 M1 : MUX6
	 port map(B,max_from_co2,min_from_co2,"0000","0000","0000",selB,mux_to_reg_2);
 M2 : MUX6
	 port map(C,max_from_co2,min_from_co2,"0000","0000","0000",selC,mux_to_reg_3);
 M3 : MUX6
	 port map(D,max_from_co2,min_from_co2,"0000","0000","0000",selD,mux_to_reg_4);
 M4 : MUX6
	 port map(E,max_from_co2,min_from_co2,"0000","0000","0000",selE,mux_to_reg_5);
 M5 : MUX6
	 port map(F,min_from_co2,"0000","0000","0000","0000",selF,mux_to_reg_6);
DFF0 :DFF generic map (N)
	 port map(CLK,RSTn,load(5),mux_to_reg_1,A1);
DFF1 :DFF generic map (N)
	 port map(CLK,RSTn,load(4),mux_to_reg_2,A2);
DFF2 :DFF generic map (N)
	 port map(CLK,RSTn,load(3),mux_to_reg_3,A3);
DFF3 :DFF generic map (N)
	 port map(CLK,RSTn,load(2),mux_to_reg_4,A4);
DFF4 :DFF generic map (N)
	 port map(CLK,RSTn,load(1),mux_to_reg_5,A5);
DFF5 :DFF generic map (N)
	 port map(CLK,RSTn,load(0),mux_to_reg_6,A6);
 M6 : MUX6
	 port map(A1,A2,A3,A4,A5,A6,selMAX,Aco2);
 M7 : MUX6
	 port map(A1,A2,A3,A4,A5,A6,selMIN,Bco2);	
	 
end architecture;

