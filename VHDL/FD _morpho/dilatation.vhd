library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity dilatation is
  port(
    E1,E2,E3,E4,E5,E6,E7,E8,E9 : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture dilatation_arch of dilatation is
begin
	S <= E1 or E2 or E3 or E4 or E5 or E6 or E7 or E8 or E9;
end architecture;
