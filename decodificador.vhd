LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity decodificador is
port(
	I : in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0)
);
end entity;

architecture arq of decodificador is
begin
	process(I)
	begin
		case I is
			when "0000" => S <= not "0111111"; -- 0
			when "0001" => S <= not "0000110"; -- 1
			when "0010" => S <= not "1011011"; -- 2
			when "0011" => S <= not "1001111"; -- 3
			when "0100" => S <= not "1100110"; -- 4
			when "0101" => S <= not "1101101"; -- 5
			when "0110" => S <= not "1111101"; -- 6
			when "0111" => S <= not "0000111"; -- 7
			when "1000" => S <= not "1111111"; -- 8
			when "1001" => S <= not "1101111"; -- 9
			when others => S <= (others => '0');
		end case;
	end process;
 end arq; 