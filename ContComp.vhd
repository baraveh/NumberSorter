library ieee;
use IEEE.std_logic_1164.all;

entity ContComp is
	generic (N : integer :=4);
	port(CLK                                : in  std_logic; --Clock, active high
	     RSTn                               : in  std_logic; --Async. Reset, active low
	     load                               : out std_logic_vector(5 downto 0);
	     output                             : out std_logic_vector (N-1 downto 0);
	     selA, selB, selC, selD, selE, selF : out std_logic_vector(2 downto 0);
	     selMAX, selMin                     : out std_logic_vector(2 downto 0)
	    );
end entity;

architecture behavior of ContComp is
	--signals decleration-------------------
type fsm is (start, state_1, state_2, state_3, state_4, state_5, state_6, state_7
	, state_8, state_9, state_10, state_11, final,REG_wait);
signal state : fsm := start;


begin
	
		
	

	process(CLK, RSTn)
	begin
		if RSTn = '0' then
			state <= start;
		elsif clk = '1' and clk'event then
			case state is
				when start =>
					load   <= "111111"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "000";
					SelD   <= "000";
					selE   <= "000";
					selF   <= "000";
					selMax <= "000";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "000";
					output <= (others=>'1');      -- load the output from the FF and input new stuff to the FF
					--this state init the FSM	
					state <= state_1;
				when state_1 =>
					load   <= "110000"; -- MSB controls A LSB controls F and so on 
					selA   <= "001";
					selB   <= "010";
					selC   <= "000";
					SelD   <= "000";
					selE   <= "000";
					selF   <= "000";
					selMax <= "000";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "001";
					output <= (others=>'0');     -- we close the loading process 
					state <= state_2;
				when state_2 =>
					load   <= "001100"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "001";
					SelD   <= "010";
					selE   <= "000";
					selF   <= "000";
					selMax <= "010";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "011";
					state <= state_3;
				when state_3 =>
					load   <= "000011"; -- MSB controls A, LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "000";
					SelD   <= "000";
					selE   <= "001";
					selF   <= "001"; -- bug was here must applay lvl 2 value not 3 like in  the rest
					selMax <= "100";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "101";
					state <= state_4;
					
				when state_4 =>
					load   <= "101000"; -- MSB controls A LSB controls F and so on 
					selA   <= "001";
					selB   <= "000";
					selC   <= "010";
					SelD   <= "000";
					selE   <= "000";
					selF   <= "000";
					selMax <= "000";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "010";
					state <= state_5;
				when state_5 =>
					load   <= "010100"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "001";
					selC   <= "000";
					SelD   <= "010";
					selE   <= "000";
					selF   <= "000";
					selMax <= "001";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "011";
					state <= state_6;
				when state_6 =>
					load   <= "100010"; -- MSB controls A LSB controls F and so on 
					selA   <= "001";
					selB   <= "000";
					selC   <= "000";
					SelD   <= "000";
					selE   <= "010";
					selF   <= "000";
					selMax <= "000";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "100";
					state <= state_7;
				when state_7 =>
					load   <= "000101"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "000";
					SelD   <= "001";
					selE   <= "000";
					selF   <= "001"; -- lvl bug here
					selMax <= "011";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "101";
					state <= state_8;
				when state_8 =>
					load   <= "001010"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "001";
					SelD   <= "000";
					selE   <= "010";
					selF   <= "000";
					selMax <= "010";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "100";
					state <= state_9;
				when state_9 =>   
					load   <= "010100"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "001";
					selC   <= "000";
					SelD   <= "010";
					selE   <= "000";
					selF   <= "000";
					selMax <= "001";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "011";
					state <= state_10;
				when state_10 =>
					load   <= "011000"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "001";
					selC   <= "010";
					SelD   <= "000";
					selE   <= "000";
					selF   <= "000";
					selMax <= "001";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "010";
					state <= state_11;
				when state_11 =>
					load   <= "000110"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "000";
					SelD   <= "001";
					selE   <= "010";
					selF   <= "000";
					selMax <= "011";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "100";
					state <= final;
				when final =>
					load   <= "001100"; -- MSB controls A LSB controls F and so on 
					selA   <= "000";
					selB   <= "000";
					selC   <= "001";
					SelD   <= "010";
					selE   <= "000";
					selF   <= "000";
					selMax <= "010";    --A=000 B=001 C=010 D=011 E=100 F=101 
					selMin <= "011";
					state <= REG_wait;
				when REG_wait=>
					state <= start; -- during this state all the nums are ready
					
				when others =>

			end case;
		
			
			
		end if;
	end process;

end behavior;