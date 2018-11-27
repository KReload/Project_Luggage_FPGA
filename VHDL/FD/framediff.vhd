library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity framediff is
  port(
    I0, I1 : std_logic_vector(7 downto 0);
    Et : out std_logic_vector(7 downto 0)
    );
end entity;

architecture framediff_arch of framediff is
  signal sabsOut, theta : std_logic_vector(7 downto 0);
begin
  theta <= "00000110"; --theta = 6
  SABS: entity work.sabs(sabs_arch) port map (A => I1, B => I0,S => sabsOut);
  CMP: entity work.cmp(cmp_arch) port map (A => sabsOut, B => theta, S => Et);
end architecture;
