LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity min_tb is
end min_tb ;


architecture BENCH of min_tb is
  signal A,B,S : std_logic_vector(7 downto 0);
begin
  UUT : entity work.min port map (A => A, B => B, S => S);
  process
  begin
    A <= "10000000";
    B <= "00001010";
    wait for 2 ns;
    assert S = "00001010" report "Error on min(128,10) = 10" severity warning;
    wait for 10 ns;

    A <= "00000001";
    B <= "00001010";
    wait for 2 ns;
    assert S = "00000001" report "Error on min(1,10) = 1" severity warning;
    wait for 10 ns;

    A <= "00001010";
    B <= "00001010";
    wait for 2 ns;
    assert S = "00001010" report "Error on min(10,10) => S = 10" severity warning;
    wait for 10 ns;    
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
