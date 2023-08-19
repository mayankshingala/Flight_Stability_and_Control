% MAIN_Q2

close all
clear all
clc

TRIM;

u0 = u_trim; v0 = v_trim; w0 = w_trim; % m/s
x0 = 0; y0 = 0; z0 = z0; % m
p0 = 0; q0 = 0.04; r0 = 0; % rad/s
phi0 = 0; theta0 = 0.002; psi0 = 0; % rad

% Initial states
a0 = [u0, v0, w0, x0, y0, z0, p0, q0, r0, phi0, theta0, psi0];

[t,y] = RK4(@EQUATIONS, 50, 0.01, a0);

% Cntrol inputs
c = zeros(numel(t), 4);
for i=1:numel(t)
    cc = CS_DEF(t(i), y(i));
    c(i,:) = cc;
end

PLOTTING;
