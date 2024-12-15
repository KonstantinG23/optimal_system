function f = odefun(t,x)
global a11 a12 a21 a22 b11 b21 delta_max K
u = -K(1)*x(1)-K(2)*x(2)-K(3)*x(3);
if abs(u) >= delta_max
    u = delta_max*sign(u);
end
f = [a11*x(1)+a12*x(2)+b11*u;a21*x(1)+a22*x(2)+b21*u; x(1)];
end
