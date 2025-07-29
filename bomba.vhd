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
	component timer is
		port(
			clock: in std_logic;
			reset: in std_logic;
			I1: in std_logic_vector(3 downto 0);
			I2: in std_logic_vector(3 downto 0);	
			S: out std_logic_vector(6 downto 0);
			D: out std_logic
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
begin

  	D1: divisor27Mhz
   port map (
      clock => clock,
      reset => reset,
      S => clock_dividido_27M
   );

	T1: timer
	port map (
		clock => clock_dividido_27M,
		reset => reset or clock_T2 or clock_T4,
		I1 => "0000",
		I2 => "1001",
		S => S1,
		D => clock_T1
	);

	T2: timer
	port map (
		clock => clock_T1,
		reset => reset or clock_T4,
		I1 => "0110",
		I2 => "0110",
		S => S2,
		D => Clock_T2
	);	

	T3: timer
	port map (
		clock => Clock_T2,
		reset => reset or clock_T4,
		I1 => "0011",
		I2 => "0011",
		S => S3,
		D => clock_T3
	);	
	
	T4: timer
	port map (
		clock => Clock_T3,
		reset => reset,
		I1 => "0010",
		I2 => "0010",
		S => S4,
		D => clock_T4
	);		
	
end arq;