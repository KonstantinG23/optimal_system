clear all
clc
global a11 a12 a21 a22 b11 b21 delta_max tm fi0
set([figure(1) figure(2)], 'WindowStyle', 'Docked');
n = 2;
config
w0_baz2 = fminsearch('fmsfun2',[0.1]);
w0_baz2
tp2 = fmsfun2(w0_baz2)
w0_baz4 = fminsearch('fmsfun4',[0.1]);
w0_baz4
tp4 = fmsfun2(w0_baz4)