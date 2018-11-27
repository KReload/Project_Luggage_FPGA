LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity mul_tb is
end mul_tb ;


architecture BENCH of mul_tb is
  signal A,N : std_logic_vector(7 downto 0);
  signal S : std_logic_vector(7 downto 0);
begin
  UUT : entity work.mul port map (A => A, N => N, S => S);
  process
  begin
    A <= "11000000";
    N <= "00000010";
    wait for 2 ns;
    assert S = "11111111" report "Error on 192*2 = 255" severity warning;
    wait for 10 ns;

    A <= "00000101";
    N <= "00000011";
    wait for 2 ns;
    assert S = "00001111" report "Error on 6*3 = 18" severity warning;
    wait for 10 ns;
    
    A <= "11111111";
    N <= "00100000";
    wait for 2 ns;
    assert S = "11111111" report "Error on 255*32=255" severity warning;
    wait for 10 ns;  
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
