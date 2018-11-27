library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sub is
  port(
    A,B : in std_logic_vector(7 downto 0);
    S : out signed(8 downto 0)
    );
end entity;

architecture sub_arch of sub is
begin
  S <= signed(A) - signed(B);
end architecture;
