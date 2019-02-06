library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity erosion is
  port(
    E1,E2,E3,E4,E5,E6,E7,E8,E9 : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture erosion_arch of erosion is
begin
	S <= E1 and E2 and E3 and E4 and E5 and E6 and E7 and E8 and E9;
end architecture;
