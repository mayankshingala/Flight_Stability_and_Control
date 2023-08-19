% EQUATIONS

function a_dot = EQUATIONS(t, a)

PARAMETERS;

u = a(1);       v = a(2);       w = a(3);
x = a(4);       y = a(5);       z = a(6);
p = a(7);       q = a(8);       r = a(9);
phi = a(10);    theta = a(11);  psi = a(12);

ctrl = CS_DEF(t,a);

[Fxaero, Fyaero, Fzaero, l, M, N] = FORCEMOMENT(a, ctrl);

T = ctrl(4);

u_dot = Fxaero/m + T/m - q*w + r*v - g*sin(theta);
v_dot = Fyaero/m - r*u + p*w + g*cos(theta)*sin(phi);
w_dot = Fzaero/m - p*v + q*u + g*cos(theta)*cos(phi);

p_dot = (l*Izz + N*Ixz - p*q*(Ixz*(Iyy-Ixx-Izz)) - q*r*(Izz*(Izz-Iyy)+Ixz^2))/(Ixx*Izz - Ixz^2);
q_dot = (M + p*r*(Izz-Ixx) - Ixz*(p^2-r^2))/Iyy;
r_dot = (l*Ixz + N*Ixx + p*q*(Ixz^2+Ixx*(Ixx-Iyy)) + q*r*(Ixz*(Iyy-Ixx-Izz)))/(Ixx*Izz - Ixz^2);

%*********************
phi_mat = [1    0           0;
           0    cos(phi)    sin(phi);
           0    -sin(phi)   cos(phi)];

theta_mat = [cos(theta)     0   -sin(theta);
             0              1   0;
             sin(theta)     0   cos(theta)];
 
psi_mat = [cos(psi)     sin(psi)    0;
           -sin(psi)    cos(psi)    0;
           0            0           1];

xyz_mat = psi_mat' * theta_mat' * phi_mat' * [u;  v;  w];
x_dot = xyz_mat(1);
y_dot = xyz_mat(2);
z_dot = xyz_mat(3);

% p,q,r to euler angles
pqr2eul = [1        sin(phi)*tan(theta)     cos(phi)*tan(theta);
           0        cos(phi)                -sin(phi);
           0        sin(phi)/cos(theta)     cos(phi)/cos(theta)];

phithetapsi_dot_mat = pqr2eul*[p;   q;  r];

phi_dot = phithetapsi_dot_mat(1);
theta_dot = phithetapsi_dot_mat(2);
psi_dot = phithetapsi_dot_mat(3);

%****************************

a_dot = [u_dot, v_dot, w_dot, x_dot, y_dot, z_dot, p_dot, q_dot, r_dot, phi_dot, theta_dot, psi_dot]';

end