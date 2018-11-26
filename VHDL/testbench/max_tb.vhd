LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity max_tb is
end max_tb ;


architecture BENCH of max_tb is
  signal A,B,S : std_logic_vector(7 downto 0);
begin
  UUT : entity work.max port map (A => A, B => B, S => S);
  process
  begin
    A <= "10000000";
    B <= "00001010";
    wait for 2 ns;
    assert S = "10000000" report "Error on max(128,10) = 128" severity warning;
    wait for 10 ns;

    A <= "00000001";
    B <= "00001010";
    wait for 2 ns;
    assert S = "00001010" report "Error on max(1,10) = 10" severity warning;
    wait for 10 ns;

    A <= "00001010";
    B <= "00001010";
    wait for 2 ns;
    assert S = "00001010" report "Error on max(10,10) => S = 10" severity warning;
    wait for 10 ns;    
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
