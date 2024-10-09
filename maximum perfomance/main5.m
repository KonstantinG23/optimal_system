clear, clc, cla
ti0=[1.5 1.8];
T=fminsearch('costfunc',ti0)
legend('x1','x2','u','Interpreter','latex')
title("Transition processes",'Interpreter','latex')
grid