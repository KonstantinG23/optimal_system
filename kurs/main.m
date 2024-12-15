clc
clear
close all
set([figure(1) figure(2)], 'WindowStyle', 'Docked');
syms s t psi_10 psi_20 psi_1 psi_2 x1 x2 u
T = 2;
x10 = 1; 
x20 = 0;

% Аналитический метод
H = psi_1*x2 + psi_2*(-x2 + u) - u^2;
u0 = solve(diff(H,u) == 0);
eqns_merg = [x2; -x2 + u0; 0; psi_1 - psi_2];
eqns_Lap_1 = [s*psi_1 - psi_10 - eqns_merg(3) == 0; s*psi_2 - psi_20 - eqns_merg(4) == 0];
sol_Lap_1 = solve(eqns_Lap_1,[psi_1, psi_2]);
eqns_Lap_2 = [s*x1 - x10 - eqns_merg(1) == 0; s*x2 - x20 - eqns_merg(2) == 0];
sol_Lap_2 = solve(eqns_Lap_2,[x1, x2]);
sol_Lap_2 = subs(sol_Lap_2,[psi_1 psi_2], [sol_Lap_1.psi_1 sol_Lap_1.psi_2]);

eqns_Origin_1 = ilaplace([sol_Lap_1.psi_1 == 0; sol_Lap_1.psi_2] == 0);
eqns_Origin_2 = ilaplace([sol_Lap_2.x1 == 0; sol_Lap_2.x2] == 0);
sol_Origin_2 = solve(eqns_Origin_2,[psi_10, psi_20]);
x30 = eval(subs(sol_Origin_2.psi_10, t, T));
x40 = eval(subs(sol_Origin_2.psi_20, t, T));
x0 = [x10 x20 x30 x40];
odefun = @(t,x) [x(2); -x(2) + 0.5*x(4); 0; x(3) - x(4)];
[t,x]=ode45(odefun,[0 T],x0);
figure(1)
plot(t,x(:,1),'r',t,x(:,2),'g',t,0.5*x(:,4),'b');
title('Analitical solution','Interpreter','latex')
grid
legend('x1','x2','psi_2*0.5')

% численный метод
Psi0B=[1 0];
Psi0=fminsearch('costfunc',Psi0B);
title('Numerical solution','Interpreter','latex')
grid
