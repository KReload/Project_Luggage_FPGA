library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity absolu is
  port(
    E : in signed(8 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture absolu_arch of absolu is
begin
  S <= std_logic_vector(abs(E));
end architecture;
