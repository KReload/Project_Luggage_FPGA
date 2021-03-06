library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity cmp is
  port(
    A,B : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture cmp_arch of cmp is
begin
  process(A,B)
  begin
    if (A < B) then
      S <= "00000000";
    else
      S <= "11111111";
    end if;
  end process;
end architecture;
