clc, clear, cla
global umax T
set([figure(1) figure(2)], 'WindowStyle', 'Docked');
syms s t psi_10 psi_20 psi_1 psi_2 x1 x2 u
umax = 1.3;
x10 = -1.6; 
T = [2 5];

% Аналитический метод
H = -psi_1*x2 + psi_2*(-2*x2 + u) - 1;
u0 = umax*sign(psi_2);
eqns_merg = [-x2; -2*x2 + u0; 0; -psi_1 - 2*psi_2];

% t = 0:0.01:5;
% for i = 1:length(t)
%     u(i) = u_fun(t(i));
% end

% figure(1)
% plot(t,u)
% grid
% ti0=[1.5 1.8];
% T=fminsearch('costfunc5',ti0)