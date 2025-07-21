library ieee;
    use ieee.std_logic_1164.all; 
    use ieee.numeric_std.all; 
    use ieee.std_logic_unsigned.all; 

entity contador is
  port (
    clock, reset: in std_logic; 
    I: in std_logic_vector(3 downto 0); -- Entrada que define o valor inicial do contador
    S: out std_logic_vector(3 downto 0) 
  );
end contador;

architecture arq of contador is
signal count: std_logic_vector(3 downto 0) := I;
begin
    process(clock, reset) 
    begin
        if reset = '1' then 
            count <= I; -- Quando reset é '1', reinicia com o valor de I
        elsif rising_edge(clock) then 
            if count = "0000" then 
                count <= I; -- Se chegou a zero, reinicia com o valor de I
            else
                count <= count - 1;
            end if;
        end if;
        S <= count; 
    end process;
end arq;