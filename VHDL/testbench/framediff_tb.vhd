LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity framediff_tb is
end framediff_tb ;


architecture BENCH of framediff_tb is
  signal Et : std_logic_vector(7 downto 0);
  signal clk,rst : std_logic;
begin
  UUT : entity work.framediff port map (clk => clk, rst => rst, Et => Et);

  ClockGenerator: process
  begin
    clk <= '0';
    wait for 2 ns;
    clk <= '1';
    wait for 2 ns;
  end process;

  process
  begin
    rst <= '1';
    rst <= '0';
    wait for 3 ns;
    assert Et = "00000000" report "Error on 0" severity warning;	
    wait for 4 ns;
    assert Et = "00000000" report "Error on 1" severity warning;
    wait for 4 ns;
    assert Et = "00000000" report "Error on 2" severity warning;
    wait for 4 ns;
    assert Et = "00000000" report "Error on 3" severity warning;
    wait for 4 ns;

    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
