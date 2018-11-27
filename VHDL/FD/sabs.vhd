library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sabs is
  port(
    A,B : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture sabs_arch of sabs is
signal tmp : std_logic_vector(8 downto 0);
begin
  tmp <= std_logic_vector(abs(signed('0' & A) - signed('0' & B)));
  S <= tmp(7 downto 0);
end architecture;
