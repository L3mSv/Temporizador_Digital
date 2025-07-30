library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;

entity contador is
  port (
    clock: in std_logic;
    reset1: in std_logic; 
	 reset2: in std_logic; 
    I1: in std_logic_vector(3 downto 0);
    I2: in std_logic_vector(3 downto 0); 	
    S: out std_logic_vector(3 downto 0);
	 D: out std_logic
  );
end contador;

architecture arq of contador is
signal count: std_logic_vector(3 downto 0) := I1;

begin
   process(clock, reset1, reset2)
   begin
      if reset1 = '1' and reset2 = '0' then
         count <= I1;
		elsif reset2 = '1' then
         count <= I2;
      elsif rising_edge(clock) then
         if count >= "0000" then
				count <= count - 1;
			end if;	
      end if;
   end process;
   S <= count;
	D <= '1' when count = "1111" else '0';
end arq;