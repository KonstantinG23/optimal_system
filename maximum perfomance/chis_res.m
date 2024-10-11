function crit = chis_res(T_inp)
global umax x10
t1 = T_inp(1);
T = T_inp(2);
u0 = umax;
syst = @(t, x) [1.5*x(2); -x(2) + u0*sign(t1-t)];
x0 = [x10; 0];
ts = [0 T];
[t, x] = ode45(syst, ts, x0);
u_res = u0*sign(t1-t);
crit = x(end,1)^2 + x(end,2)^2;
figure(1)
plot(t, x, t, u_res), grid
xlabel('t, c')
legend('x1', 'x2', 'u')
pause(0.02)
end