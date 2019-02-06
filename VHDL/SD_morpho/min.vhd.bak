library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity min is
  port(
    A,B : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture min_arch of min is
begin
  process(A,B)
  begin
    if (A < B) then
      S <= "A";
    else
      S <= "B";
    end if;
  end process;
end architecture;
