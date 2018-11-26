LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity absolu_tb is
end absolu_tb ;


architecture BENCH of absolu_tb is
  signal E : signed(8 downto 0);
  signal S : std_logic_vector(7 downto 0);
begin
  UUT : entity work.absolu port map (E => E, S => S);
  process
  begin
    E <= "010100100";
    wait for 2 ns;
    assert S = "10100100" report "Error on abs(164)=164" severity warning;
    wait for 10 ns;

    E <= "110100100";
    wait for 2 ns;
    assert S = "10100100" report "Error on abs(-164)=164" severity warning;
    wait for 10 ns;
    
   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
