%% RK4

function [t,y] = RK4(dydt, tf, h, y0)       % dydt means derivative states

% Converted to column vector
y0 = reshape(y0, [], 1);

n = tf/h;
d = size(y0,1);

t = zeros(n,1);
y = zeros(n,d);

tn = 0;
yn = y0;

t(1,:) = tn;
y(1,:) = yn';

for i = 2:n+1

k1 = dydt(tn, yn);
k2 = dydt(tn + h/2, yn + h*k1/2);
k3 = dydt(tn + h/2, yn + h*k2/2);
k4 = dydt(tn + h, yn + h*k3);

yn = yn + (k1 + 2*k2 + 2*k3 + k4)*h/6;
tn = tn + h;

t(i) = tn;
y(i,:) = yn';

end

end