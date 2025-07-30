library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity timer is
  port (
		clock: in std_logic;
		reset: in std_logic;
		I1: in std_logic_vector(3 downto 0);
		I2: in std_logic_vector(3 downto 0);	
		S: out std_logic_vector(6 downto 0);
		D: out std_logic
  );
end timer;

architecture arq of timer is
  component divisor
    port (
      clock: in std_logic;
      reset: in std_logic;
      I: in std_logic_vector(3 downto 0);
      S: out std_logic
    );
  end component;

  component contador
    port (
      clock: in std_logic;
		reset: in std_logic;
      I1: in std_logic_vector(3 downto 0);
      I2: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(3 downto 0)
    );
  end component;

  	component decodificador
   port(
      I: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(6 downto 0)
   );
	end component;
	 
	signal unidades: std_logic_vector(3 downto 0);
begin

	D <= '0' when unidades = "9999" else '1';

	 CONT: contador
    port map (
      clock => clock,
      reset => reset,
		I1 => I1,
      I2 => I2,
      S => unidades
    );

	DEC: decodificador
	port map (
		I => unidades,
		S => S
	);
end arq;