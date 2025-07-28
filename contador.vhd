library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;

entity contador is
  port (
    clock: in std_logic;
    reset: in std_logic; 
    I1: in std_logic_vector(3 downto 0);
    I2: in std_logic_vector(3 downto 0); 
	 Z: out std_logic; 
    S: out std_logic_vector(3 downto 0)
  );
end contador;

architecture arq of contador is
signal count: std_logic_vector(3 downto 0) := I1;
signal zero_detected: std_logic := '0';
begin
   process(clock, reset)
   begin
		if reset = '1' then
			count <= I1;
		elsif rising_edge(clock) then
			if count > "0000" then
				zero_detected <= '0';
				count <= count - 1;
			else
				count <= I2;
				zero_detected <= '1'; 
			end if;	
		end if;
		S <= count;
		Z <= zero_detected;
	end process;
end arq;