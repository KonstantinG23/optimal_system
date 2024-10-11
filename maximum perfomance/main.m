clc
clear
global umax T x10
set([figure(1)], 'WindowStyle', 'Docked');
umax = 1.3;
x10 = -1.6; 
ti0=[1 2];
grid
T=fminsearch('chis_res',ti0);