LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity cmp_tb is
end cmp_tb ;


architecture BENCH of cmp_tb is
  signal A,B,S : std_logic_vector(7 downto 0);
begin
  UUT : entity work.cmp port map (A => A, B => B, S => S);
  process
  begin
    A <= "10000000";
    B <= "00001010";
    wait for 2 ns;
    assert S = "11111111" report "Error on 128 < 10 => S = 255" severity warning;
    wait for 10 ns;

    A <= "00000001";
    B <= "00001010";
    wait for 2 ns;
    assert S = "00000000" report "Error on 1 < 10 => S = 0" severity warning;
    wait for 10 ns;

    A <= "00001010";
    B <= "00001010";
    wait for 2 ns;
    assert S = "11111111" report "Error on 10 < 10 => S = 255" severity warning;
    wait for 10 ns;    
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
