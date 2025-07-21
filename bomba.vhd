library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
	 use ieee.std_logic_unsigned.all;

entity bomba is
  port (
    clock, reset: in std_logic; 
	 S1: out std_logic_vector(6 downto 0);
	 S2: out std_logic_vector(6 downto 0);
	 S3: out std_logic_vector(6 downto 0);
	 S4: out std_logic_vector(6 downto 0)
  );
end bomba; 

architecture arq of bomba is
  component timer
	  port (
		 clock, reset: in std_logic; 
		 I1, I2: in std_logic_vector(3 downto 0);
		 S1, S2: out std_logic_vector(6 downto 0)
	  );
  end component;
  
  component divisor
    port (
      clock, reset : in std_logic;
      I : in std_logic_vector(24 downto 0);
      S : out std_logic
    );
  end component;

	signal clock_dividido_1: std_logic;
	signal clock_dividido_2: std_logic;
begin
	D1: divisor
    port map (
      clock => clock,
      reset => reset,
      I => "0000001000001111010110000",
      S => clock_dividido_1
    );

	D2: divisor
    port map (
      clock => clock_dividido_1,
      reset => reset,
      I => "0000000000000000000011000",
      S => clock_dividido_2
   );
	 
   M1: timer
    port map (
      clock => clock_dividido_1,
      reset => reset, 
		I1 => "1010",
		I2 => "0110",
		S1 => S1,
		S2 => S2
    );
	
   M2: timer
    port map (
      clock => clock_dividido_2,
      reset => reset, 
		I1 => "0100",
		I2 => "0011",
		S1 => S3,
		S2 => S4
    );
end arq ;