--Practica 5
--Jaime Ramirez Stanford
--A00825248
--Laboratorio de sistemas digitales
library IEEE;
use IEEE.std_logic_1164.all;

entity counter is 
port(clk: in bit; uni_min, dec_min: out bit_vector(3 downto 0); uni_hour: out bit_vector(3 downto 0):="0001"; dec_hour: out bit);
--Una variable de entrada: clock signal
--4 variables de salida: 3 vectores: Dos para las decenas y unidades de los minutos (se necesitara el 0 a 9 en unidades y 0 a 5 en decenas)
--Un vector para las horas inicializado en uno
--Una variable de tipo bit ya que al ser reloj de 12 horas solo se necesita 0 y uno en las decenas
end counter;

architecture behavior of counter is
component jk is
port(clk, en, j, k: in bit; q, qn: out bit);
end component;
signal Qa, QNa, Ja, Ka, Qb, QNb, Jb, Kb, QNc, Jc, Kc: bit_vector(3 downto 0);
signal Qc: bit_vector(3 downto 0):="0001";
signal Qd,QNd,Jd, Kd, enable_min, enable_hour: bit;
begin
Ja(0) <='1';
Ka(0)<='1';
Ja(1) <= QNa(3) and Qa(0);
Ka(1) <= Qa(0);
Ja(2) <= Qa(1) and Qa(0);
Ka(2) <= Qa(1) and Qa(0);
Ja(3) <= Qa(0) and Qa(1) and Qa(2);
Ka(3) <= Qa(0);
jka0: jk port map(clk,'1',Ja(0),Ka(0),Qa(0),QNa(0));
jka1: jk port map(clk,'1',Ja(1),Ka(1),Qa(1),QNa(1));
jka2: jk port map(clk,'1',Ja(2),Ka(2),Qa(2),QNa(2));
jka3: jk port map(clk,'1',Ja(3),Ka(3),Qa(3),QNa(3));
uni_min(0) <= Qa(0);
uni_min(1) <= Qa(1);
uni_min(2) <= Qa(2);
uni_min(3) <= Qa(3);
enable_min <= (Qa(0) and QNa(1) and QNa(2) and Qa(3));
Jb(0) <= '1';
Kb(0) <='1';
Jb(1)<= QNb(2) and Qb(0);
Kb(1)<= Qb(0);
Jb(2)<=Qb(0) and Qb(1);
Kb(2)<=Qb(0);
Jb(3)<='0';
Kb(3)<='1';
jkb0: jk port map(clk,enable_min,Jb(0),Kb(0),Qb(0),QNb(0));
jkb1: jk port map(clk,enable_min,Jb(1),Kb(1),Qb(1),QNb(1));
jkb2: jk port map(clk,enable_min,Jb(2),Kb(2),Qb(2),QNb(2));
jkb3: jk port map(clk,enable_min,Jb(3),Kb(3),Qb(3),QNb(3));
dec_min(0)<=Qb(0);
dec_min(1)<=Qb(1);
dec_min(2)<=Qb(2);
dec_min(3)<=Qb(3);
enable_hour <=(Qa(0) and QNa(1) and QNa(2) and Qa(3) and Qb(0) and QNb(1) and Qb(2) and QNb(3));
Jc(0)<='1';
Kc(0)<='1';
Jc(1)<=QNc(3) and Qc(0);
Kc(1)<=Qd or Qc(0);
Jc(2)<=Qc(0) and Qc(1);
Kc(2)<=Qc(0) and Qc(1);
Jc(3)<=Qc(0) and Qc(1) and Qc(2);
Kc(3)<=Qc(0);
Jd<=Qc(3) and Qc(0);
Kd<=Qc(1);
jkc: jk port map(clk, enable_hour, Jd, Kd, Qd, QNd);
jkc0: jk port map(clk,enable_hour,Jc(0),Kc(0),Qc(0),QNc(0));
jkc1: jk port map(clk,enable_hour,Jc(1),Kc(1),Qc(1),QNc(1));
jkc2: jk port map(clk,enable_hour,Jc(2),Kc(2),Qc(2),QNc(2));
jkc3: jk port map(clk,enable_hour,Jc(3),Kc(3),Qc(3),QNc(3));
uni_hour(0)<=Qc(0);
uni_hour(1)<=Qc(1);
uni_hour(2)<=Qc(2);
uni_hour(3)<=Qc(3);
dec_hour<=Qd;
end Behavior;

