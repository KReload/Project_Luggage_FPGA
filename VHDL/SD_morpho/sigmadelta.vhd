library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sigmadelta is
  port(
    V : in std_logic_vector(7 downto 0);
	clk, rst: in std_logic;
    Vupdate, M1, Et : out std_logic_vector(7 downto 0) 
    );
end entity;

architecture sigmadelta_arch of sigmadelta is
  signal CMP0out, REG0out, SABS0out, MULout, REG1out, CMP1out, REG2out, REG3out, MINout, MAXout, N, Vmax, Vmin, din, M0, I1 : std_logic_vector(7 downto 0);
  signal addrInMAE, addrOutMAE : std_logic_vector(16 downto 0);
  signal wea : std_logic_vector(0 downto 0);
  signal en, we : std_logic;
  
    component blk_mem_gen_0
    port (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  end component;
 
  component blk_mem_gen_1
      port (
          clka : IN STD_LOGIC;
          ena : IN STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
          dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    end component;
    
begin
  
  process(clk)
  begin
    if rising_edge(clk) then
        addrInMAE <= addrOutMAE;
    end if;
  end process;
  
  din <= "00000000";
	N <= "00000010"; --N = 2
	Vmax <= "11111110"; --Vmax = 254
	Vmin <= "00000001"; --Vmin = 1
	we <= '1';
	en <= '1';
	wea <= "1";
	
	MAE0: entity work.MAE(MAE_arch) port map (clk => clk, rst => rst, addr_prec => addrInMAE, addr => addrOutMAE);
	MEMORY0 : blk_mem_gen_0 port map (clka => clk, ena => en, wea => wea, addra => addrOutMAE, dina => din, douta => M0);
  MEMORY1 : blk_mem_gen_1 port map (clka => clk, ena => en, wea => wea, addra => addrOutMAE, dina => din, douta => I1);
	CMP0: entity work.cmpeq(cmpeq_arch) port map (A => M0, B => I1, S => CMP0out); --CMP0out direction la mémoire dans M1 et SABS0
	REG0: entity work.reg(reg_arch) port map (DATAIN => I1, RST => rst, CLK => clk, WE => we, DATAOUT => REG0out); --REG0out direction le SABS0
	SABS0: entity work.sabs(sabs_arch) port map (A => CMP0out, B => REG0out, S => SABS0out); --SABS0out direction le MUL et le REG1
	MUL: entity work.mul(mul_arch) port map (A => CMP0out, N => REG0out, S => MULout);
	CMP1: entity work.cmpeq(cmpeq_arch) port map (A => V, B => SABS0out, S => CMP1out); 
	REG1: entity work.reg(reg_arch) port map (DATAIN => SABS0out, RST => rst, CLK => clk, WE => we, DATAOUT => REG1out);
	MIN: entity work.min(min_arch) port map (A => CMP1out, B => Vmax, S => MINout);
	REG2: entity work.reg(reg_arch) port map (DATAIN => REG1out, RST => rst, CLK => clk, WE => we, DATAOUT => REG2out);
	MAX: entity work.max(max_arch) port map (A => MINout, B => Vmin, S => MAXout); --MAXout direction V (update) et CMP2
	REG3: entity work.reg(reg_arch) port map (DATAIN => REG2out, RST => rst, CLK => clk, WE => we, DATAOUT => REG3out);
	CMP2: entity work.cmp(cmp_arch) port map (A => REG3out, B => MAXout, S => Et);
	
	M1 <= CMP0out;
	Vupdate <= MAXout;
end architecture;
