library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sigmadelta is
  port(
    V, M0, I1 : in std_logic_vector(7 downto 0);
    Vupdate, M1, Et : out std_logic_vector(7 downto 0) 
    );
end entity;

architecture sigmadelta_arch of sigmadelta is
  signal CMP0out, REG0out, SABS0out, MULout, REG1out, CMP1out, REG2out, REG3out, MINout, N, Vmax, Vmin : std_logic_vector(7 downto 0);
  signal clk, rst, we : std_logic;
begin
	N <= "00000010"; --N = 2
	Vmax <= "11111110"; --Vmax = 254
	Vmin <= "00000001"; --Vmin = 1
	CMP0: entity work.cmp(cmp_arch) port map (A => M0, B => I1, S => CMP0out); --CMP0out direction la mémoire dans M1 et SABS0
	REG0: entity work.reg(reg_arch) port map (DATAIN => I0, RST => rst, CLK => clk, WE => we, DATAOUT => REG0out); --REG0out direction le SABS0
	SABS0: entity work.sabs(sabs_arch) port map (A => CMP0out, B => REG0out, S => SABS0out); --SABS0out direction le MUL et le REG1
	MUL: entity work.mul(mul_arch) port map (A => CMP0out, B => REG0out, S => MULout);
	CMP1: entity work.cmp(cmp_arch) port map (A => V, B => SABS0out, S => CMP1out); 
	REG1: entity work.reg(reg_arch) port map (DATAIN => SABS0out, RST => rst, CLK => clk, WE => we, DATAOUT => REG1out);
	MIN: entity work.min(min_arch) port map (A => CMP1out, B => Vmax, S => MINout);
	REG2: entity work.reg(reg_arch) port map (DATAIN => REG1out, RST => rst, CLK => clk, WE => we, DATAOUT => REG2out);
	MAX: entity work.max(max_arch) port map (A => MINout, B => Vmin, S => MAXout); --MAXout direction V (update) et CMP2
	REG3: entity work.reg(reg_arch) port map (DATAIN => REG2out, RST => rst, CLK => clk, WE => we, DATAOUT => REG3out);
	CMP2: entity work.cmp(cmp_arch) port map (A => REG3out, B => MAXout, S => Et);
	M1 <= CMP0out;
	Vupdate <= MAXout;
end architecture;
