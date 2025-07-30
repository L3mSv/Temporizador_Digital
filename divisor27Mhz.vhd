Library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

Entity divisor27Mhz is
port (
    clock: in std_logic;
	 reset : in std_logic; 
    S : out std_logic
);
end divisor27Mhz;

architecture arq of divisor27Mhz is
begin
    process(clock, reset)
        variable count: std_logic_vector(24 downto 0);
        variable temp : std_logic;
    begin
        if reset = '1' then
            count := (others => '0');
            temp := '0';
        elsif clock'event and clock = '1' then
            if count = "0010000011110101100000000" then
                count := (others => '0');
                temp := not temp;
            else
                count := count + 1;
            end if;
        end if;
        S <= temp;
    end process;
end arq;