LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity framediff_tb is
end framediff_tb ;


architecture BENCH of framediff_tb is
  signal I0,I1,Et : std_logic_vector(7 downto 0);
begin
  UUT : entity work.framediff port map (I0 => I0, I1 => I1, Et => Et);
  process
  begin
    I0 <= "00100000";
    I1 <= "00000101";
    wait for 2 ns;
    assert Et = "11111111" report "Error on abs(32-5)=27 > 6 => Et = 255" severity warning;
    wait for 10 ns;

    A <= "00000101";
    B <= "00100000";
    wait for 2 ns;
    assert Et = "11111111" report "Error on abs(5-32)=27 > 6 => Et = 255" severity warning;
    wait for 10 ns;
    
    A <= "11111111";
    B <= "11111110";
    wait for 2 ns;
    assert Et = "11111111" report "Error on abs(255-254)=1 < 6 => Et = 0" severity warning;
    wait for 10 ns;
    
    A <= "11111111";
    B <= "11111001";
    wait for 2 ns;
    assert Et = "11111111" report "Error on abs(255-249)=6 == 6 => Et = 0" severity warning;
    wait for 10 ns;

    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
