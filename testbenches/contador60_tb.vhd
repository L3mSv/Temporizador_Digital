library IEEE;
use IEEE.std_logic_1164.all;

entity contador60_tb is 
end entity contador60_tb;

architecture test of contador60_tb is
	signal clock: std_logic := '0';
	signal reset: std_logic := '1';
	signal ajuste: std_logic_vector(5 downto 0) := "110000";
	signal saida_out: std_logic_vector(5 downto 0);

	component contador60 is 
	port(
	clock, reset: in std_logic;
	ajuste: in std_logic_vector(5 downto 0);
    saida: out std_logic_vector(5 downto 0)
	);
	end component contador60;
	
begin 

	clock <= not clock after 1 ns;
	reset <= '1', '0' after 5 ns;
	
	contador60_instance: component contador60
	port map(
	clock => clock,
	reset => reset,
	ajuste => ajuste,
	saida => saida_out
	);
	
	stimulus:
		process begin
			wait until (reset = '0');
			
			for i in 0 to 100 loop 
				wait until rising_edge(clock);
			end loop;
			
			wait;
		end process stimulus;
end test;