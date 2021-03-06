library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity MAE is
  port(
    clk, rst : in std_logic;
    addr_prec : in std_logic_vector(16 downto 0);
    addr : out std_logic_vector(16 downto 0)
  );
end entity;

architecture MAE_arch of MAE is
signal ETAT : integer := 0;   
begin
  process(clk,rst)
  begin
    if rst = '0' then --reset asynchrone
      if rising_edge(clk) then
          case ETAT is
            when 0 => addr <= "00000000000000000";
		      ETAT <= 1;
            when 1 => if (addr_prec = "10100011110101111") then
                        ETAT <= 0;
		      end if;
                      addr <= std_logic_vector(unsigned(addr_prec) + 1);
	    when others => ETAT <= 1;
          end case;
      end if;
    end if;
  end process;
end architecture;
