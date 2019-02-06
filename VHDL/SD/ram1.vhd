library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram1 is
  port(
    addr : in std_logic_vector(16 downto 0);
    q : out std_logic_vector(7 downto 0)
  );
end entity;

architecture ram1_arch of ram1 is
type img is array(9 downto 0) of std_logic_vector(7 downto 0);
signal image: img :=(
  "00000001",
  "00000001",
  "00000011",
  "00000100",
  "00000100",
  "00000100",
  "00000011",
  "00000100",
  "01001110",
  "11111111"
  );
  
begin
  q <= image(To_integer(unsigned(addr)));
end architecture;
