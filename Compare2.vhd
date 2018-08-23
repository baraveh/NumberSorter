library ieee;
use ieee.std_logic_1164.all;

entity Compare2 is
	generic (N : integer := 4);
	port (
		A : in  std_logic_vector (N-1 downto 0);-- first number
		B : in  std_logic_vector (N-1 downto 0);-- Second number
		Max : out std_logic_vector (N-1 downto 0);-- Larger number
		Min : out std_logic_vector (N-1 downto 0)-- Smaller number
);
end entity;

architecture behavior of Compare2 is


begin
	process (A, B)
	begin
		if A > B then 
			Max <= A;
			Min <= B;
		else
			max <= B;
			Min <= A;
		end if;
	end process;


end  architecture;

