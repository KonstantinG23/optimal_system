clear all
clc
close all
global a11 a12 a21 a22 b11 b21 delta_max tm fi0
options = optimset('PlotFcns',@optimplotfval);
set([figure(1) figure(2) figure(3) figure(4)], 'WindowStyle', 'Docked');
n = 7; % номер модели судна в соответствии с вариантом в МУ
config
switch n
    case 1
        w = 0.1;
    case 4
        w = 0.5;
    case 7
        w = 0.5;
end
w0_baz2 = fminsearch('fmsfun2',[w]);
w0_baz2
tp2 = fmsfun2(w0_baz2)
w0_baz4 = fminsearch('fmsfun4',[w]);
w0_baz4
tp4 = fmsfun2(w0_baz4)