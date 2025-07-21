library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
	 use ieee.std_logic_unsigned.all;

entity timer is
  port (
    clock, reset: in std_logic; 
	 I1, I2: in std_logic_vector(3 downto 0);
	 S1, S2: out std_logic_vector(6 downto 0)
  );
end timer; 

architecture arq of timer is
  component contador
    port (
      clock, reset: in std_logic;
      I: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(3 downto 0)
    );
  end component;
  
   component decodificador
    port (
      I: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(6 downto 0)
    );
  end component;
  
  signal unidades, dezenas: std_logic_vector(3 downto 0);
  signal clock_unidades, clock_dezenas: std_logic;
begin
	clock_unidades <= clock;
	clock_dezenas <= '1' when unidades = I1 else '0';
	
   cont_unidades: contador
    port map (
      clock => clock_unidades,
      reset => reset, 
      I => I1,
      S => unidades
    );

  cont_dezenas: contador
    port map (
      clock => clock_dezenas,
      reset => reset, 
      I => I2,
      S => dezenas
    );

   display_unidade: decodificador
    port map (
      I => unidades,
      S => S1
    );

   display_dezena: decodificador
    port map (
      I => dezenas,
      S => S2
    );
end arq ;