library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mae is
  port(
    clk, rst, flagmmu : in std_logic;
    V1Old, M1Old, I0 : in std_logic_vector(7 downto 0);
    M0, M1, V0, V1: out std_logic_vector(7 downto 0);
    flagI0 : out std_logic
  );
end entity;

architecture mae_arch of mae is
signal ETAT : integer := 0;   
begin
  process(clk,rst)
  begin
    if rst = '0' then --reset asynchrone
      if rising_edge(clk) then
          case ETAT is
            when 0 => M0 <= I0;
                      M1 <= "00000000";
                      V0 <= "00000001";
                      V1 <= "00000000";
                      ETAT <= 2;
            when 1 => M0 <= M1Old;
                      M1 <= "00000000";
                      V0 <= V1Old;
                      V1 <= "00000000";
                      ETAT <= 2;
	          when 2 => if (flagmmu = '1') then
	                       ETAT <= 1;
	                    end if;
	          when others => null;
          end case;
      end if;
    end if;
  end process;
end architecture;
