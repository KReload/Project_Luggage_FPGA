library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_tb is
end entity;

architecture BENCH of reg_tb is
  signal Din, Dout : std_logic_vector(7 downto 0);
  signal rst,clk,we : std_logic;
begin
  UUT : entity work.reg port map (DATAIN => Din, RST => rst, CLK => clk, WE => we, DATAOUT => Dout);
  
  ClockGenerator: process
  begin
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
  end process;
  
  process
  begin
    Din <= "00010001";
    rst <= '0';
    we <= '1';
    wait for 2 ns;
    assert Dout = "00010001" report "Error on Dout<=Din" severity warning;
    wait for 10 ns;
    
    we <= '0';
    Din <= "00011111";
    wait for 2 ns;
    assert Dout = "00010001"report "Error on Dout <= Dout" severity warning;
    wait for 10 ns;
    
    rst <= '1';
    wait for 2 ns;
    assert Dout = "00000000" report "Error on rst" severity warning;
    wait for 10 ns;
    
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end architecture;
