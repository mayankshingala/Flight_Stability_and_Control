%% POINT MASS MODEL

function dstates = pointMassModel(~,states)

v = states(1); 
gamma = states(2); 
x = states(3); 
y = states(4);

rho = DENSITY(y);

S = 0; % m^2 (Assuming Point mass)
cd0 = 0.302;
m = 160; % kg
g = 9.81; % m/s

D = 0.5*rho*v^2*S*cd0;

v_dot = -(D + m*g*sin(gamma))/m;
gamma_dot = -g*cos(gamma)/v;
x_dot = v*cos(gamma);
y_dot = v*sin(gamma);

dstates = [v_dot; gamma_dot; x_dot; y_dot];
end