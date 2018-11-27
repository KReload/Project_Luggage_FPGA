library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity cmpeq is
  port(
    A,B : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture cmpeq_arch of cmpeq is
begin
  process(A,B)
  begin
    if (A < B) then
      S <= A + "00000001";
    elsif (A > B) then
      S <= A - "00000001";
    else
      S <= A;
    end if;
  end process;
end architecture;
