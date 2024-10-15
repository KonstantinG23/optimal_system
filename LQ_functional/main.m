clc
clear
global umax T x10 x20
% set([figure(1)], 'WindowStyle', 'Docked');
syms s t lambda x10 x20 psi_10 psi_20 psi_1 psi_2 x1 x2 u A B C D

x0 = [x10; x20; psi_10; psi_20];

L = 0.5*(lambda*x1^2 + u^2);
sys = [1.5*x2; -x2 + u];
H = psi_1*sys(1) + psi_2*sys(2) - L;
u0 = solve(diff(H,u) == 0);
eqns_psi = -[diff(H,x1); diff(H,x2)];
sys_merg = subs([sys; eqns_psi], u, u0);
st_var = [x1; x2; psi_1; psi_2];

% матрицы А пока что задаем вручную 
A_1 = [0  1.5  0  0; 
       0  -1   0  1; 
       1   0   0  0; 
       0   0 -1.5 1];
eqns_Lap_1 = solve(s*st_var - x0 - A_1*st_var == 0, x0);
A_2 = [ s -1.5  0   0; 
        0  s+2  0  -1;
       -1   0   s   0;
        0   0  1.5 s-1];
% используем правило Крамера
Det_s = det(A_2)
A_2(:,4) = x0;
Det_4_s = det(A_2)
u_s = Det_4_s/Det_s
pretty(u_s)
u_s = (A*s + B)/(0.25) + (C*s + D)/(4*s^4 + 4*s^3 - 8*s^2 + 9);
% A = 
pretty(u_s)

% ilaplace(u_s)

% u_t = 
% eqns_orig_1 = ilaplace([eqns_Lap_1.x1; ...
%                         eqns_Lap_1.x2; ...
%                         eqns_Lap_1.psi_1; ...
%                         eqns_Lap_1.psi_2])
% solve(eqns_orig_1