library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bram is
    port(
        DOut: out std_logic_vector(31 downto 0);
        ADDR: in std_logic_vector(8 downto 0);
        CLK, WE: in std_logic;
        DIn0, DIn1: in std_logic_vector(31 downto 0);
    );
end bram;

architecture bram_arch of bram is
begin
  process(CLK,WE)
  begin
    if rising_edge(CLK) then
      if WE = '1' then
        DOut <= 
                     
end bram_arch
