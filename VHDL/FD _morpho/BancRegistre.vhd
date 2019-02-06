library IEEE;   
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity BancRegistre is
  port(
    DATAIN : in std_logic_vector(7 downto 0);
    RST, CLK, WE: in std_logic;
    R0, R1, R2, R3, R4, R5, R6, R7, R8 : out std_logic_vector(7 downto 0)
    );
end entity;

architecture BR_arch of BancRegistre is
signal REG0out, REG1out, REG2out, REG3out, REG4out, REG5out, REG6out, REG7out : std_logic_vector(7 downto 0);  
begin
  REG0: entity work.reg(reg_arch) port map (DATAIN => DATAIN, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG0out); 
  REG1: entity work.reg(reg_arch) port map (DATAIN => REG0out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG1out); 
  REG2: entity work.reg(reg_arch) port map (DATAIN => REG1out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG2out); 
  REG3: entity work.reg(reg_arch) port map (DATAIN => REG2out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG3out); 
  REG4: entity work.reg(reg_arch) port map (DATAIN => REG3out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG4out); 
  REG5: entity work.reg(reg_arch) port map (DATAIN => REG4out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG5out); 
  REG6: entity work.reg(reg_arch) port map (DATAIN => REG5out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG6out); 
  REG7: entity work.reg(reg_arch) port map (DATAIN => REG6out, RST => RST, CLK => CLK, WE => WE, DATAOUT => REG7out);
  REG8: entity work.reg(reg_arch) port map (DATAIN => REG7out, RST => RST, CLK => CLK, WE => WE, DATAOUT => R8);
  R0 <= REG0out;
  R1 <= REG1out;
  R2 <= REG2out;
  R3 <= REG3out;
  R4 <= REG4out;
  R5 <= REG5out;
  R6 <= REG6out;
  R7 <= REG7out;
end architecture;
