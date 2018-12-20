library IEEE;   
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_ram is
  port(
    DATAIN : in std_logic_vector(7 downto 0);
    RST, CLK: in std_logic;
    DATAOUT : out std_logic_vector(7 downto 0)
    );
end entity;

architecture reg_ram_arch of reg_ram is
begin
  process(RST,CLK)
  begin
    if RST = '1' then
      DATAOUT <= (others => '0');
    elsif RISING_EDGE(CLK) then
      DATAOUT <= DATAIN;
    end if;
  end process;
end architecture;
