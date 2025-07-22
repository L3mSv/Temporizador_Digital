library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity Temporizador is
port(
    clock, reset : in std_logic;
    ajuste24: in std_logic_vector(4 downto 0);
    ajuste60: in std_logic_vector(5 downto 0);
    saida24: out std_logic_vector(4 downto 0);
    saida60: out std_logic_vector(5 downto 0);
    display24_out : out std_logic_vector(13 downto 0);
    display60_out : out std_logic_vector(13 downto 0);
);
end Temporizador ; 

architecture arq of Temporizador is
signal clock_100Hz : std_logic;

component contador24 is
port(
    clock, reset: in std_logic;
    ajuste: in std_logic_vector(4 downto 0);
    saida: out std_logic_vector(4 downto 0)
);
end component;

component contador60 is 
port(
    clock, reset: in std_logic;
    ajuste: in std_logic_vector(5 downto 0);
    saida: out std_logic_vector(5 downto 0)
);
end component;

component display24 is
port(
    I : in std_logic_vector(4 downto 0); 
    display_s : out std_logic_vector(13 downto 0) 
);
end component;

component display60 is
port(
    I : in std_logic_vector(4 downto 0); 
    display_s : out std_logic_vector(13 downto 0) 
);
end component;

component divisorFrequencia100hz is
port(
    clock,reset : in std_logic;
    q : out std_logic
);
end component;


begin

contador24_instance: contador24 
port map(
    clock => clock_100Hz,
    reset => reset,
    ajuste => ajuste24,
    saida => saida24
);

contador60_instance: contador60 
port map(
    clock => clock_100Hz,
    reset => reset,
    ajuste => ajuste60,
    saida => saida60
);

display24_instance: display24
port map(
    I => saida24,
    display_s => display24_out
);

display60_instance: display60
port map(
    I => saida60(4 downto 0),
    display_s => display60_out
);

divisorFrequencia_instance: divisorFrequencia100hz
port map(
    clock => clock,
    reset => reset,
    q => clock_100Hz
);

end arq;