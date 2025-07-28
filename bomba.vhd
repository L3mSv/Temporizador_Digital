library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity bomba is
	port(
		clock, reset: in std_logic; 		
		S1: out std_logic_vector(6 downto 0);
		S2: out std_logic_vector(6 downto 0);
		S3: out std_logic_vector(6 downto 0);
		S4: out std_logic_vector(6 downto 0)
	);
end bomba; 

architecture arq of bomba is
	component decodificador
   port(
      I: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(6 downto 0)
   );
	end component;

	component timer is
		port(
			clock, reset: in std_logic; 
			S1: out std_logic_vector(3 downto 0);
			S2: out std_logic_vector(3 downto 0);
			S3: out std_logic_vector(3 downto 0);
			S4: out std_logic_vector(3 downto 0)
		);
	end component;

	signal unidades_1, dezenas_1, unidades_2, dezenas_2: std_logic_vector(3 downto 0);
	begin

	T1: timer
	port map (
		clock => clock,
		reset => reset,
		S1 => unidades_1,
		S2 => dezenas_1,
		S3 => unidades_2,
		S4 => dezenas_2
	);

	D1: decodificador
	port map (
		I => unidades_1,
		S => S1
	);  

	D2: decodificador
	port map (
			I => dezenas_1,
			S => S2
	  );

	D3: decodificador
	port map (
			I => unidades_2,
			S => S3
	  );

	D4: decodificador
	port map (
			I => dezenas_2,
			S => S4
	);
end arq;