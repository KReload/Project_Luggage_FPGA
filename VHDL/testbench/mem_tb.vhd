LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity mem_tb is
end mem_tb ;


architecture BENCH of mem_tb is
  
begin
  UUT : entity work.mem port map ();
    
  process
  begin
    addr0 <= "000000000000000000";
    addr1 <= "000000000000000001";
    wait for 2 ns;
    assert q0 = "000000000000000001" report "Error on addr0 = 1" severity warning;
    assert q1 = "000000000000000010" report "Error on addr1 = 2" severity warning;
    wait for 10 ns;

    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;