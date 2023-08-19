% TRIM CONDITION OF AIRCRAFT (Assumed typical cruise velocity & cruise
% altitude from Wikipedia)

PARAMETERS;
beta_trim = 0;

h = 2500;
rho = DENSITY(h);
z0 = -h

Vinf = 60;

W = m*g;
Q = 1/2*rho*Vinf^2;

cLtrim = W / (Q*S)
cDtrim = CD_0 + k*cLtrim^2;
Thrust = Q*S*cDtrim

res = inv([CL_alpha CL_de; CM_alpha CM_de])*[cLtrim-CL_0; -CM_0];

alpha_trim = res(1)
delE_trim = res(2)

u_trim = Vinf*cos(alpha_trim)*cos(beta_trim)
v_trim = Vinf*sin(beta_trim)
w_trim = Vinf*sin(alpha_trim)*cos(beta_trim)