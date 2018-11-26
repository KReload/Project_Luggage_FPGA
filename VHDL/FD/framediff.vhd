library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity framediff is
  port(
    I0, I1 : std_logic_vector(7 downto 0);
    Et : out std_logic_vector(7 downto 0);
    );
end entity;

architecture framediff_arch of framediff is
  signal subOut, absOut, theta : std_logic_vector(7 downto 0); 
begin
  theta <= "00000110"; --theta = 6
  SUB: entity work.sub(sub_arch) port map (A => I0, B => I1, S => subOut);
  ABSOLU: entity work.absolu(absolu_arch) port map (E => subOut, S => absOut);
  CMP: entity work.cmp(cmp_arch) port map (A => absOut, B => theta, S => Et);
end architecture;
