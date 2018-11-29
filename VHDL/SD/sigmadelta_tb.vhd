LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity sigmadelta_tb is
end sigmadelta_tb ;


architecture BENCH of sigmadelta_tb is
    V, M0, I1, Vupdate, M1, Et : std_logic_vector(7 downto 0);
begin
  UUT : entity work.sigmadelta port map (V => V, M0 => M0, I1 => I1, Vupdate => Vupdate, M1 => M1, Et => Et);
  process
  begin
    V <= "00000000";
    M0 <= "00000000";
    I1 <= "00000000";
    wait for 2 ns;
    assert Et = "11111111" report "Error on Et = 255" severity warning;
	assert M1 = "00000000" report "Error on M1=M0" severity warning;
    assert Vupdate = "00000000" report "Error on Vupdate=V" severity warning;
	wait for 10 ns;

    V <= "00000001";
    M0 <= "00000000";
    I1 <= "00000000";
    wait for 2 ns;
    assert Et = "00000000" report "Error on Et = 0" severity warning;
	assert M1 = "00000000" report "Error on M1=M0" severity warning;
    assert Vupdate = "00000000" report "Error on Vupdate=V-1" severity warning;
    wait for 10 ns;

    V <= "00000000";
    M0 <= "00000010";
    I1 <= "00000000";
    wait for 2 ns;
	assert Et = "11111111" report "Error on Et = 255" severity warning;
	assert M1 = "00000001" report "Error on M1=M0-1" severity warning;
    assert Vupdate = "00000001" report "Error on Vupdate=V+1" severity warning;
    wait for 10 ns;

    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
