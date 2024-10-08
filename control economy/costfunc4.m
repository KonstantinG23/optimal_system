function f=costfunc4(Ksi0)
global T
h_odefun = @(t,x) [-x(2); -2*x(2) + 0.5*x(4); 0; -x(3) - 2*x(4)]
[t,x]=ode45(h_odefun,[0 T],[1 0 Ksi0(1) Ksi0(2)]);
%вычисление невязки
f=x(end,1)*x(end,1)+x(end,2)*x(end,2);
% наблюдение за процессом поиска
figure(2)
plot(t,x(:,1),'r',t,x(:,2),'g',t,0.5*x(:,4),'b')
pause(0.002)