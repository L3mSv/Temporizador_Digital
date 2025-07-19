library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
	 use ieee.std_logic_unsigned.all;

entity contador60 is
  port (
    clock, reset: in std_logic;
    saida: out std_logic_vector(5 downto 0)
  );
end contador60; 

architecture arq of contador60 is
signal count: std_logic_vector(5 downto 0);
signal temp: std_logic; 
begin
    process(clock, reset, count)
		begin
        if reset = '1' or (count = "111100") then 
            count <= "000000";
		 elsif rising_edge(clock) then
            count <= count + 1;
			end if;
		 saida <= count;
    end process;
end arq ;