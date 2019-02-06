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
  signal en : std_logic;
  signal we : std_logic_vector(0 downto 0);
  signal sabsOut, theta, din, I0, I1 : std_logic_vector(7 downto 0);
  signal addr0inMAE : std_logic_vector(16 downto 0); --:= "00000000000000000";
  signal addr0outMAE : std_logic_vector(16 downto 0);
  
    
begin
  theta <= "00000110"; --theta = 6
  en <= '1';
  we <= "0";
  din <= "00000000";
  process(clk)
  begin
    if rising_edge(clk) then
        addr0inMAE <= addr0outMAE;
    end if;
  end process;

  MAE: entity work.MAE(MAE_arch) port map (clk => clk, rst => rst, addr_prec => addr0inMAE, addr => addr0outMAE);
  MEMORY0 : entity work.ram1(ram1_arch) port map (addr => addr0outMAE, q => I0);
  MEMORY1 : entity work.ram2(ram2_arch) port map (addr => addr0outMAE, q => I1);
  SABS: entity work.sabs(sabs_arch) port map (A => I1, B => I0,S => sabsOut);
  CMP: entity work.cmp(cmp_arch) port map (A => sabsOut, B => theta, S => Et);
  
end architecture;