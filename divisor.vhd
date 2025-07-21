Library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

Entity divisor is
port (
    clock, reset : in std_logic;
    I : in std_logic_vector(24 downto 0); 
    S : out std_logic
);
end divisor;

architecture arq of divisor is
begin
    process(clock, reset)
        variable count: std_logic_vector(24 downto 0);
        variable temp : std_logic;
    begin
        if reset = '1' then
            count := (others => '0');
            temp := '0';
        elsif clock'event and clock = '1' then
            if count = I then
                count := (others => '0');
                temp := not temp;
            else
                count := count + 1;
            end if;
        end if;
        S <= temp;
    end process;
end arq;