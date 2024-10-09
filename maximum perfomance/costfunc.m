function f=costfunc5(T)
global t1
t=[]; x=[]; u=[];
t1=T(1);
h_u=@(t) (t>t1)-(t<=t1); % прямоугольная волна
h_odefun = @(t,x) [x(2);h_u(t)]; 
[t,x]=ode45(h_odefun,[0 abs(T(2))],[1 0]);
%вычисление невязки
f=x(end,1)^2+x(end,2)^2;
plot([t t t],[x(:,1),x(:,2),h_u(t)],"LineWidth",1.5)
pause(0.02)