library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram2 is
  port(
    addr : in std_logic_vector(16 downto 0);
    q : out std_logic_vector(7 downto 0)
  );
end entity;

architecture ram2_arch of ram2 is
type img is array(9 downto 0) of std_logic_vector(7 downto 0);
signal image: img :=(
  "00000001",
  "00000001",
  "00000011",
  "00000100",
  "01000100",
  "00011100",
  "00000010",
  "00000000",
  "01111110",
  "11111110"
  );
  
begin
  q <= image(To_integer(unsigned(addr)));
end architecture;
