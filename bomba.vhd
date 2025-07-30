library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity bomba is
	port(
		clock: in std_logic;
		reset: in std_logic;	
		S1: out std_logic_vector(6 downto 0);
		S2: out std_logic_vector(6 downto 0);
		S3: out std_logic_vector(6 downto 0);
		S4: out std_logic_vector(6 downto 0)
	);
end bomba; 

architecture arq of bomba is
  component contador
    port (
      clock: in std_logic;
		reset1: in std_logic;
		reset2: in std_logic;
      I1: in std_logic_vector(3 downto 0);
      I2: in std_logic_vector(3 downto 0);
		S: out std_logic_vector(3 downto 0);
		D: out std_logic
    );
  end component;

  	component decodificador
   port(
      I: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(6 downto 0)
   );
	end component;
	
  component divisor27Mhz
    port (
      clock: in std_logic;
      reset: in std_logic;
      S: out std_logic
    );
	end component;	
	
	signal clock_dividido_27M, clock_T1, clock_T2, clock_T3, clock_T4: std_logic;
	signal unidades_1, dezenas_1: std_logic_vector(3 downto 0);
	signal unidades_2, dezenas_2: std_logic_vector(3 downto 0);
begin

  	D1: divisor27Mhz
   port map (
      clock => clock,
      reset => reset,
      S => clock_dividido_27M
   );

	C1: contador
	port map (
		clock => clock_dividido_27M,
		reset1 => reset or clock_T2 or clock_T4,
		reset2 => clock_T1,
		I1 => "0000",
		I2 => "1001",
		S => unidades_1,
		D => clock_T1
	);

	C2: contador
	port map (
		clock => clock_T1,
		reset1 => reset or clock_T4,
		reset2 => clock_T2,
		I1 => "0110",
		I2 => "0110",
		S => dezenas_1,
		D => clock_T2
	);

	C3: contador
	port map (
		clock => clock_T2,
		reset1 => reset or clock_T4,
		reset2 => clock_T3,
		I1 => "0011",
		I2 => "1001",
		S => unidades_2,
		D => clock_T3
	);

	C4: contador
	port map (
		clock => clock_T3,
		reset1 => reset,
		reset2 => clock_T4,
		I1 => "0010",
		I2 => "0010",
		S => dezenas_2,
		D => clock_T4
	);
	
	DEC_1: decodificador
	port map (
		I => unidades_1,
		S => S1
	);

	DEC_2: decodificador
	port map (
		I => dezenas_1,
		S => S2
	);	
	
	DEC_3: decodificador
	port map (
		I => unidades_2,
		S => S3
	);	
	
	DEC_4: decodificador
	port map (
		I => dezenas_2,
		S => S4
	);	
end arq;