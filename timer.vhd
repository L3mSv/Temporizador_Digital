library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity timer is
	port(
		clock, reset: in std_logic; 
		S1: out std_logic_vector(3 downto 0);
		S2: out std_logic_vector(3 downto 0);
		S3: out std_logic_vector(3 downto 0);
		S4: out std_logic_vector(3 downto 0)
	);
end timer; 

architecture arq of timer is
	component divisor
   port(
      clock: in std_logic;
      reset: in std_logic;
      I: in std_logic_vector(24 downto 0);
      S: out std_logic
   );
	end component;
	
	component contador
   port(
      clock: in std_logic;
      reset: in std_logic; 
      I1: in std_logic_vector(3 downto 0);
      I2: in std_logic_vector(3 downto 0); 
      Z: out std_logic; 
      S: out std_logic_vector(3 downto 0)
   );
	end component;

	signal clock_dividido_27M: std_logic;
	signal z_unidades_1, z_dezenas_1, z_unidades_2, z_dezenas_2: std_logic;

begin
  	D1: divisor
   port map (
      clock => clock,
      reset => reset,
      I => "1000001111010110000000000", 
      S => clock_dividido_27M
   );

	C1: contador
   port map (
      clock => clock_dividido_27M,
      reset => reset or z_dezenas_2 or z_dezenas_1,
      I1 => "0000", 
      I2 => "1001", 
      Z => z_unidades_1,
      S => S1
    );
	 
	C2: contador
   port map (
      clock => z_unidades_1,
      reset => reset or z_dezenas_2,
      I1 => "0110", 
      I2 => "0110", 
      Z => z_dezenas_1,
      S => S2
   );

	C3: contador
   port map (
      clock => z_dezenas_1,
      reset => reset or z_dezenas_2,
      I1 => "0100", 
      I2 => "0100", 
      Z => z_unidades_2,
      S => S3
   );

	C4: contador
   port map (
      clock => z_unidades_2,
      reset => reset,
      I1 => "0010", 
      I2 => "0010", 
      Z => z_dezenas_2,
      S => S4
   );
end arq;