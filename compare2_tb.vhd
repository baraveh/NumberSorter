library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compare2_tb is
end entity;

architecture behavior of compare2_tb is


	component Compare2 is
		generic(N : integer := 4);
		port(
			A   : in  std_logic_vector(N - 1 downto 0); -- first number
			B   : in  std_logic_vector(N - 1 downto 0); -- Second number
			Max : out std_logic_vector(N - 1 downto 0); -- Larger number
			Min : out std_logic_vector(N - 1 downto 0) -- Smaller number
		);
	end component;

	signal test_vector    : std_logic :='0';
	signal A,B,Min,Max: integer range 0 to 15 :=0;
	signal A_1,B_1,Min_1,Max_1: std_logic_vector(3 downto 0);
begin
	
	U0 : Compare2
		generic map(4)
		port map(A_1,B_1,Max_1,min_1);
		
		
		A_1 <= std_logic_vector(to_unsigned(A,4));
		B_1 <= std_logic_vector(to_unsigned(B,4));
		Max <= to_integer(unsigned(Max_1));
		min <= to_integer(unsigned(Min_1));
		
	process
		begin
		for i in 0 to 15 loop
			for j in 0 to 15 loop 
				A<=i; B<=j;
				if (A_1>B_1) and (A_1=Max_1) and (b_1=min_1) then 
					test_vector<='1';
				elsif (B_1>A_1) and (B_1=Max_1) and (A_1=min_1) then
					test_vector<='1';
				elsif (A_1=B_1) and (A_1=Max_1) and (b_1=min_1) then 
					test_vector<='1';
				else
					test_vector<='0';
				
				end if;
			wait for  10 ns;
		end loop; 
		end loop;	
		
		
		
		

	end process;

end architecture;
