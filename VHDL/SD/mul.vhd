library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul is
  port(
    A,N : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture mul_arch of mul is
signal mult,cmp :std_logic_vector(15 downto 0);
begin
	cmp <= "0000000011111111";
   mult <= std_logic_vector(unsigned(A)*unsigned(N));
   process(mult)
   begin
   	if (mult > cmp) then
   		S <= "11111111";
    	else
    		S <= mult(7 downto 0);
    	end if;
   end process;
end architecture;
