library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.std_logic_unsigned.all;

entity contador60 is
  port (
    clock, reset: in std_logic;
    ajuste: in std_logic_vector(5 downto 0) := "111011";
    saida: out std_logic_vector(5 downto 0)
  );
end contador60; 

architecture arq of contador60 is
signal count: std_logic_vector(5 downto 0);
begin
  process(clock, reset)
	begin
    if reset = '1' then 
      count <= ajuste;
	  elsif rising_edge(clock) then
      if count = "000000" then 
        count <= ajuste;
      else
        count <= count - 1;
		  end if;
	  end if;
  end process;
	saida <= count;
end arq ;