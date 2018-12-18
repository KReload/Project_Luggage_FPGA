library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bram is
    port(
        DOut: out std_logic_vector(31 downto 0);
        ADDR: in std_logic_vector(8 downto 0);
        CLK: in std_logic;
        DIn0, DIn1: in std_logic_vector(31 downto 0);
    );
end bram;

architecture bram_arch of bram is
begin
    DOut <= 0x400000C
end bram_arch
