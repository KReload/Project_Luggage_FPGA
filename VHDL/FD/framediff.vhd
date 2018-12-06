library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity framediff is
  port(
    clk,rst : in std_logic;
    Et : out std_logic_vector(7 downto 0)
    );
end entity;

architecture framediff_arch of framediff is
  constant N : integer := 2;
  signal sabsOut, theta, I0, I1 : std_logic_vector(7 downto 0);
  signal addr0outMAE : unsigned(17 downto 0) := "000000000000000000";
  signal addr1outMAE : unsigned(17 downto 0) := "010100101000000000";
  signal irq0, irq1 : std_logic;
begin
  theta <= "00000110"; --theta = 6
  
  MAE: entity work.MAE(MAE_arch) port map (clk => clk, rst => rst, addr0_prec => addr0outMAE, addr1_prec => addr1outMAE, addr0 => addr0outMAE, addr1 => addr1outMAE, irq_mem0 => irq0, irq_mem1 => irq1);
  MEMORY : entity work.mem(mem_arch) generic map (N => N) port map (addr0 => addr0outMAE, addr1 => addr1outMAE, q0 => I0, q1 => I1);
  SABS: entity work.sabs(sabs_arch) port map (A => I1, B => I0,S => sabsOut);
  CMP: entity work.cmp(cmp_arch) port map (A => sabsOut, B => theta, S => Et);
end architecture;
