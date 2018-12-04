library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity MAE is
  port(
    clk, rst : in std_logic;
    addr0_prec, addr1_prec : in unsigned(17 downto 0);
    irq_mem1, irq_mem2 : out std_logic;
    addr0, addr1 : out unsigned(17 downto 0)
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
          when 0 => irq_mem0 <= '1';
                    irq_mem1 <= '1';
                    addr0 <= addr0_prec + 1;
                    addr1 <= addr1_prec + 1;
        end case;
      end if;
    end if;
  end process;
end architecture;
