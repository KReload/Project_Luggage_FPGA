library IEEE;   
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
  port(
    DATAIN : in std_logic_vector(7 downto 0);
    RST, CLK, WE: in std_logic;
    DATAOUT : out std_logic_vector(7 downto 0)
    );
end entity;

architecture reg_arch of reg is
begin
  process(RST,CLK)
  begin
    if RST = '1' then
      DATAOUT <= (others => '0');
    elsif RISING_EDGE(CLK) then
      if WE = '1' then
        DATAOUT <= DATAIN;
      end if;
    end if;
  end process;
end architecture;
