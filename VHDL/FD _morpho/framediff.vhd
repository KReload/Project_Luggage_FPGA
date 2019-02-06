library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity framediff is
  port(
    clk,rst : in std_logic;
    Etm : out std_logic_vector(7 downto 0)
    );
end entity;

architecture framediff_arch of framediff is
  constant N : integer := 2;
  signal we, en : std_logic;
  signal sabsOut, theta, din, I0, I1, Et, OUV0out : std_logic_vector(7 downto 0);
  signal addr0inMAE : std_logic_vector(16 downto 0); --:= "00000000000000000";
  signal addr0outMAE : std_logic_vector(16 downto 0);
  signal R0_0, R1_0, R2_0, R3_0, R4_0, R5_0, R6_0, R7_0, R8_0 : std_logic_vector(7 downto 0);
  signal R0_1, R1_1, R2_1, R3_1, R4_1, R5_1, R6_1, R7_1, R8_1 : std_logic_vector(7 downto 0);
    
begin
  theta <= "00000110"; --theta = 6
  en <= '1';
  we <= '1';
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
  BR0: entity work.BancRegistre(BR_arch) port map (DATAIN => Et, RST => rst, CLK => clk, WE => we, R0 => R0_0, R1 => R1_0, R2 => R2_0, R3 => R3_0, R4 => R4_0, R5 => R5_0, R6 => R6_0, R7 => R7_0, R8 => R8_0);
  OUV0: entity work.ouverture(ouverture_arch) port map(E1 => R0_0, E2 => R1_0, E3 => R2_0, E4 => R3_0, E5 => R4_0, E6 => R5_0, E7 => R6_0, E8 => R7_0, E9 => R8_0, RST => rst, CLK => clk, WE => we, S => OUV0out);
  BR1: entity work.BancRegistre(BR_arch) port map (DATAIN => OUV0out, RST => rst, CLK => clk, WE => we, R0 => R0_1, R1 => R1_1, R2 => R2_1, R3 => R3_1, R4 => R4_1, R5 => R5_1, R6 => R6_1, R7 => R7_1, R8 => R8_1);
  FER0: entity work.fermeture(fermeture_arch) port map(E1 => R0_1, E2 => R1_1, E3 => R2_1, E4 => R3_1, E5 => R4_1, E6 => R5_1, E7 => R6_1, E8 => R7_1, E9 => R8_1, RST => rst, CLK => clk, WE => we, S => Etm);
  
end architecture;