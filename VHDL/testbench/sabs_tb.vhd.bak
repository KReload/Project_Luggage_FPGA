LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity sabs_tb is
end sabs_tb ;


architecture BENCH of sabs_tb is
  signal A,B : std_logic_vector(7 downto 0);
  signal S : signed(7 downto 0);
begin
  UUT : entity work.sabs port map (A => A, B => B, S => S);
  process
  begin
    A <= "00100000";
    B <= "00000101";
    wait for 2 ns;
    assert S = "00011011" report "Error on abs(32)-5=27" severity warning;
    wait for 10 ns;

    A <= "00000101";
    B <= "00100000";
    wait for 2 ns;
    assert S = "00011011" report "Error on abs(5-32)=27" severity warning;
    wait for 10 ns;
    
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
