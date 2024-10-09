function u = u_fun(t)
global umax T
u = -umax;
if t < T(1)
    u = -umax;
elseif all([t >= T(1),t < T(2)])
    u = umax;
elseif t >= T(2)
    u = 0;
end
u = u;
end