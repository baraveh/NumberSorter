library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Top_tb is
end entity;

architecture top_test of Top_tb is

component Top is
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
end component;

	

	signal test_vector    : std_logic :='0';
	signal clk     		  : std_logic :='0';
	signal rstn 	      : std_logic :='1';
	signal A,B,C,D,E,F,First,Second,Third,Fourth,Fifth,Sixth		   : integer range 0 to 15 :=0;
	signal A_1,B_1,C_1,D_1,E_1,F_1,num_1,num_2,num_3,num_4,num_5,num_6 : std_logic_vector(3 downto 0);
	signal true_counter   : integer range 0 to 16777218 :=0;
	signal test_clk       :std_logic :='0';
	
begin
	
top_connect: top generic map(4) port map(clk,rstn,A_1,B_1,C_1,D_1,E_1,F_1,num_1,num_2,num_3,num_4,num_5,num_6);
		
		
		A_1 <= std_logic_vector(to_unsigned(A,4));
		B_1 <= std_logic_vector(to_unsigned(B,4));
		c_1 <= std_logic_vector(to_unsigned(C,4));
		d_1 <= std_logic_vector(to_unsigned(D,4));
		e_1 <= std_logic_vector(to_unsigned(E,4));
		f_1 <= std_logic_vector(to_unsigned(F,4));
		First <= to_integer(unsigned(num_1));
		Second <= to_integer(unsigned(num_2));
		Third <= to_integer(unsigned(num_3));
		Fourth <= to_integer(unsigned(num_4));
		Fifth <= to_integer(unsigned(num_5));
		Sixth <= to_integer(unsigned(num_6));
		
	process
	begin	
		for i_1 in 0 to 15 loop
			for i_2 in 0 to 15 loop
				for i_3 in 0 to 15 loop
					for i_4 in 0 to 15 loop
						for i_5 in 0 to 15 loop
							for i_6 in 0 to 15 loop
				A<=i_1;B<=i_2;C<=i_3;D<=i_4;E<=i_5;F<=i_6;
				if true_counter>=16777217 then
					test_vector<='1';
				end if;
			wait for 140 ns;	
		end loop; 
		end loop;
		end loop;
		end loop;
		end loop;
		end loop;
	
	end process;
	
	process 
	begin
		wait for 140 ns ;
		if  First>=Second and Second>=Third and Third>=Fourth
				 and Fourth>=Fifth and Fifth>= Sixth then
					true_counter<=true_counter+1;
				end if;
		
	end process;
	
	
	process
	begin 
		clk<='0';
			wait for 5 ns;
		clk<='1';
			wait for 5 ns;
	end process;
	
		process
	begin 
		test_clk<='0';
			wait for 70 ns;
		test_clk<='1';
			wait for 70 ns;
	end process;
	

end architecture;
