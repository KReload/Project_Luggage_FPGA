LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity mem_tb is
end mem_tb ;


architecture BENCH of mem_tb is
  constant N : integer := 2;
  signal addr0, addr1 : unsigned(17 downto 0);
  signal q0,q1 : std_logic_vector(7 downto 0);
begin
  UUT : entity work.mem
    generic map(N => N)
    port map (addr0 => addr0,addr1 => addr1,q0 => q0,q1 => q1);
  
  process
  begin
    addr0 <= "000000000000000000";
    addr1 <= "010100011110110001";
    wait for 2 ns;
    assert q0 = "00000001" report "Error on q0 = 0" severity warning;
    assert q1 = "00000001" report "Error on q1 = 255" severity warning;
    wait for 10 ns;

    report "End of test. Verify that no error was reported.";
    wait;
  end process;
end BENCH;
