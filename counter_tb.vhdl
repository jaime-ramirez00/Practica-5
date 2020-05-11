--Testbench de reloj contador de 12 horas
--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter_tb is
end counter_tb;
architecture behavior of counter_tb is 
    component counter
     port(
     clk : in  bit;
     uni_min, dec_min : out  bit_vector(3 downto 0);
     uni_hour : out  bit_vector(3 downto 0):= "0001";
     dec_hour : out  bit);
     end component;
   signal clk : bit := '0';
   signal uni_min : bit_vector(3 downto 0) := "0000";
   signal dec_min : bit_vector(3 downto 0) := "0000";
   signal uni_hour : bit_vector(3 downto 0) := "0001";
   signal dec_hour : bit := '0';
begin
   uut: counter port map (
          clk => clk,
          uni_min => uni_min,
          dec_min => dec_min,
          uni_hour => uni_hour,
          dec_hour => dec_hour
        );
 clk_process :process
        begin
             clk <= '0';
             wait for 10 ns;
             clk <= '1';
             wait for 10 ns;
        end process;
end;