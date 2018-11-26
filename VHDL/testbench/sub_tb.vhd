LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity sub_tb is
end sub_tb ;


architecture BENCH of sub_tb is
  signal A,B : std_logic_vector(7 downto 0);
  signal S : signed(8 downto 0);
begin
  UUT : entity work.sub port map (A => A, B => B, S => S);
  process
  begin
    A <= "00100000";
    B <= "00000101";
    wait for 2 ns;
    assert S = "000011011" report "Error on 32-5=27" severity warning;
    wait for 10 ns;

    A <= "00000101";
    B <= "00100000";
    wait for 2 ns;
    assert S = "100011011" report "Error on 5-32=-27" severity warning;
    wait for 10 ns;
    
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
