clear all
close all
clc
T0 = [1 1.5];
[res, crit] = fminsearch(@chis_res, T0);

function crit = chis_res(T_inp)
t1 = T_inp(1);
T = T_inp(2);
u0 = -umax;
syst = @(t, X) [-2*X(1) + X(2); -X(1) + u0*sign(t1-t)];
ts = [0 T];
x0 = [1; 0];
[t, X] = ode45(syst, ts, x0);
u_res = u0*sign(t1-t);
crit = X(end,1)^2 + X(end,2)^2;
figure(1)
plot(t, X, t, u_res), grid
xlabel('t, c')
legend('x1', 'x2', 'u')
pause(0.1)
end