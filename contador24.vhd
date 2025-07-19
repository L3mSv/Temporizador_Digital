library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.std_logic_unsigned.all;

entity contador24 is
  port (
    clock, reset: in std_logic;
    ajuste: in std_logic_vector(4 downto 0) := "10111";
    saida: out std_logic_vector(4 downto 0)
  );
end contador24; 

architecture arq of contador24 is
signal count: std_logic_vector(4 downto 0) := ajuste;
begin
  process(clock, reset, ajuste)
	begin
    if reset = '1' then 
      count <= ajuste;
    elsif rising_edge(clock) then
      if count = "00000" then 
        count <= ajuste;
      else
        count <= count - 1;
		  end if;
	  end if;
  end process;
	saida <= count;
end arq ;