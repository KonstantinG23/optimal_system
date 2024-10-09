function f=costfunc5(T)
global t1 t2 umax
t=[]; x=[]; u=[];
t1 = T(1);
t2 = T(2)
h_u=@(t) (t>t1)-(t<=t1); % прямоугольная волна
if t < t1
    u = umax
elseif t >= t1 && t <= t2
    u = -umax
elseif t > t2
    u = 0;
end
h_odefun = @(t,x) [-x(2); -2*x(2) + u; 0; -x(3) - 2*(4)];
[t,x]=ode45(h_odefun,[0 abs(T(2))],[1 0]);
%вычисление невязки
f=x(end,1)^2+x(end,2)^2;
plot(t,x(:,1),t,x(:,2),t,h_u(t))
pause(0.5)
