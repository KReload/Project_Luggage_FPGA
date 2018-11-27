LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity erosion_tb is
end erosion_tb ;


architecture BENCH of erosion_tb is
  signal E1,E2,E3,E4,E5,E6,E7,E8,E9,S : std_logic_vector(7 downto 0);
begin
  UUT : entity work.erosion port map (E1 => E1,E2 => E2,E3 => E3,E4 => E4,E5 => E5,E6 => E6,E7 => E7,E8 => E8,E9 => E9, S => S);
  process
  begin
    E1 <= "00000000";
    E2 <= "00000000";
    E3 <= "11111111";
    E4 <= "00000000";
    E5 <= "00000000";
    E6 <= "00000000";
    E7 <= "00000000";
    E8 <= "00000000";
    E9 <= "00000000";
    wait for 2 ns;
    assert S = "00000000" report "Error on (1) S = 0" severity warning;
    wait for 10 ns;
    
    E1 <= "11111111";
    E2 <= "11111111";
    E3 <= "11111111";
    E4 <= "11111111";
    E5 <= "11111111";
    E6 <= "11111111";
    E7 <= "11111111";
    E8 <= "11111111";
    E9 <= "11111111";
    wait for 2 ns;
    assert S = "11111111" report "Error on (2) S = 255" severity warning;
    wait for 10 ns;

 
    E1 <= "11111111";
    E2 <= "00000000";
    E3 <= "11111111";
    E4 <= "00000000";
    E5 <= "00000000";
    E6 <= "00000000";
    E7 <= "00000000";
    E8 <= "11111111";
    E9 <= "00000000";
    wait for 2 ns;
    assert S = "00000000" report "Error on (3) S = 0" severity warning;
    wait for 10 ns;

   
    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
