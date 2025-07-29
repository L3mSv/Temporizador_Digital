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
    S: out std_logic_vector(3 downto 0)
  );
end contador;

architecture arq of contador is
signal count: std_logic_vector(3 downto 0) := I1;

begin
   process(clock, reset)
   begin
      if reset = '1' then
         count <= I1;
      elsif rising_edge(clock) then
         if count + 1 > "0000" then
            count <= count - 1; 
         else
				count <= I2;
			end if;	
      end if;
   end process;
   S <= count;
end arq;