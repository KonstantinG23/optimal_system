function f4 = fmsfun4(w)
global a11 a12 a21 a22 b11 b21 delta_max K fi0 tm
uu = [];
Pol = [1 2.15*w 1.75*w^2 w^3];
R = roots(Pol);
A = [a11 a12 0; a21 a22 0; 1 0 0];
B = [b11; b21; 0];
K = acker(A,B,R);
[t,x] = ode45('odefun',[0 200],[0 0 fi0]);
for i = 1:length(t)
    u(i) = -K(1)*x(i,1)-K(2)*x(i,2)-K(3)*x(i,3);
    if abs(u(i)) >= delta_max
        u(i) = delta_max*sign(u(i));
    end
    uu=[uu u(i)];
end
for i = length(t):-1:1
    if sqrt(x(i,3)^2+x(i,2)^2+x(i,1)^2) >= 0.05*sqrt(fi0^2)
        tp = t(i);
        break;
    end
end
f4=tp;
figure(2)
subplot(2,1,1),plot(t,x),grid
xlabel('t')
legend('\omega_{y}','\beta','\phi')
subplot(2,1,2),plot(t,uu),grid
xlabel('t')
legend('u')
end
