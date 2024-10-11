clear
close all
clc
u_rev = -1.3;
u = 1.3;
syst_rev = @(t, x) [1.5*x(2); -x(2) + u_rev];
syst = @(t, x) [1.5*x(2); -x(2) + u];
ts = [0 2];
X0_rev = [0 0];
X0 = [-1.3 0];
[t_rev, x_rev] = ode45(syst_rev, [2 0], X0_rev);
[t, x] = ode45(syst, ts, X0);
figure()
plot(x_rev(:,1), x_rev(:,2), x(:,1), x(:,2)), grid
xlabel('x_1'), ylabel('x_2')
legend('линия переключения')
figure()
plot(t, x(:,1)), grid
xlabel('t, c')
legend('x1')
% Нахождение T
t1 = 1.2;
syst = @(t, x) [1.5*x(2); -x(2) + u*sign(t1-t)];
[t, x] = ode45(syst, ts, X0);
u_res = u*sign(t1-t);
figure()
plot(t, x, t, u_res), grid
xlabel('t, c')
legend('x1', 'x2', 'u')
