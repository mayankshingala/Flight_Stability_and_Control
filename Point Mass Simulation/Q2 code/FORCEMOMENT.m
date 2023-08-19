% Forces & Moments

function [Fx, Fy, Fz, l, M, N] = FORCEMOMENT(a, CS_DEF)

PARAMETERS;

u = a(1);      v = a(2);      w = a(3);
x = a(4);      y = a(5);      z = a(6);
p = a(7);      q = a(8);      r = a(9);
phi = a(10);   theta = a(11); psi = a(12);

dele = CS_DEF(1);
dela = CS_DEF(2);
delr = CS_DEF(3);

rho = DENSITY(-z);

Vinf = sqrt(u*u + v*v + w*w);
alpha = atan2(w,u);
beta = asin(v/Vinf);

p_hat = p*b/(2*Vinf);
q_hat = q*cbar/(2*Vinf);
r_hat = r*b/(2*Vinf);

CL = CL_0 + CL_alpha*alpha + CL_q*q_hat + CL_de*dele;
CD = CD_0 + k*CL^2;
Cm = CM_0 + CM_alpha*alpha + CM_q*q_hat + CM_de*dele;

Cy = CY_0 + CY_beta*beta + CY_p*p_hat + CY_r*r_hat + CY_delr*delr;
Cl = Cl_0 + Cl_beta*beta + Cl_p*p_hat + Cl_r*r_hat + Cl_delr*delr + Cl_dela*dela;
Cn = Cn_0 + Cn_beta*beta + Cn_p*p_hat + Cn_r*r_hat + Cn_delr*delr;

Cx = CL*sin(alpha) - CD*cos(alpha);
Cz = -CL*cos(alpha) + CD*sin(alpha);

Fx = 0.5*rho*(Vinf^2)*S*Cx;
Fy = 0.5*rho*(Vinf^2)*S*Cy;
Fz = 0.5*rho*(Vinf^2)*S*Cz;

l = 0.5*rho*(Vinf^2)*S*Cl*b;
M = 0.5*rho*(Vinf^2)*S*Cm*cbar;
N = 0.5*rho*(Vinf^2)*S*Cn*b;

end
