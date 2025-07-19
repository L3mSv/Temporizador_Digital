Library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

--divisor de frequencia por 16
Entity divisorFrequencia100hz is
port (clock,reset : in std_logic;
      q : out std_logic); 
end divisorFrequencia100hz;

architecture arq of divisorFrequencia100hz is
begin

	process(clock,reset)
	variable count: std_logic_vector(24 downto 0);
	variable temp : std_logic;
	begin
		if reset = '1' then
		   count := (others => '0');
		   temp := '0';
		elsif clock'event and clock = '1' then
                    if count = 270000 then 
		       count := (others => '0');
		       temp := not temp;
		    else 
		       count := count + 1;
		    end if;
		end if;
		q <= temp;
	end process;

end arq;