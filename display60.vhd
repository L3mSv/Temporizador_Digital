library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display24 is
  port (
    I : in std_logic_vector(4 downto 0); 
    display_s : out std_logic_vector(13 downto 0) 
  );
end display24;

architecture arq of display24 is


  function seg7(dig: integer) return std_logic_vector is
    variable seg: std_logic_vector(6 downto 0);
  begin
    case dig is
      when 0 => seg := "1111110";
      when 1 => seg := "0110000";
      when 2 => seg := "1101101";
      when 3 => seg := "1111001";
      when 4 => seg := "0110011";
      when 5 => seg := "1011011";
      when 6 => seg := "1011111";
      when 7 => seg := "1110000";
      when 8 => seg := "1111111";
      when 9 => seg := "1111011";
      when others => seg := "0000000";
    end case;
    return seg;
  end function;

begin
  process(I)
    variable val     : integer;
    variable dezena  : integer;
    variable unidade : integer;
    variable seg_d   : std_logic_vector(6 downto 0);
    variable seg_u   : std_logic_vector(6 downto 0);
  begin
    val := to_integer(unsigned(I));
    if val <= 60 then
      dezena := val / 10;
      unidade := val mod 10;

      seg_d := seg7(dezena);
      seg_u := seg7(unidade);

      display_s <= seg_d & seg_u;
    else
      display_s <= (others => '0'); 
    end if;
  end process;

end arq;
