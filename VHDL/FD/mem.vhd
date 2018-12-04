library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
  generic(
    N : integer range 2 to 300
    );
  port(
    addr0, addr1 : in unsigned(17 downto 0)
    q0,q1 : out std_logic_vector(7 downto 0);
  );
end entity;

architecture mem_arch of mem is
type img is array(N downto 0) of std_logic_vector(8 downto 0);

function init_img return table is
variable result : img;
begin
  
  return result;
	
end init_mem;
signal image: img:=init_img;
begin
  q0 <= image(To_integer(addr0));
  q1 <= image(To_integer(addr1));
end architecture;
