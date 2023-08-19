%% δe = 0 [6682_Bomb Model-II_Body_TF_0]

k1 = wind_tunnel_data(11);
k2 = wind_tunnel_data(12);
k3 = wind_tunnel_data(13);

NW = no_wind_data(1);
NW = NW';

q1 = head_data(11);
q2 = head_data(12);
q3 = head_data(13);

% a = [af; n1; n2; s1; s2; rm] for pitch angle = 5.947917
a1 = k1(10,2:7);
a2 = k2(10,2:7);
a3 = k3(10,2:7);

a1 = a1';   a2 = a2';   a3 = a3';

% A = [Ax; N1; N2; S1; S2; Rm] in kg and kg-m
A1 = CM*[a1 - NW];
A2 = CM*[a2 - NW];
A3 = CM*[a3 - NW];

Af1 = A1(1);    Af2 = A2(1);    Af3 = A3(1);
N11 = A1(2);    N12 = A2(2);    N13 = A3(2);
N21 = A1(3);    N22 = A2(3);    N23 = A3(3);
S11 = A1(4);    S12 = A2(4);    S13 = A3(4);
S21 = A1(5);    S22 = A2(5);    S23 = A3(5);
Rm1 = A1(6);    Rm2 = A2(6);    Rm3 = A3(6);

% FM = [fx; fy; fz; mx; my; mz]
FM1 = [-Af1; (S11+S21); -(N11+N21); Rm1; (N11-N21)*0.065; (S11-S21)*0.065]*9.81;
FM2 = [-Af2; (S12+S22); -(N12+N22); Rm2; (N12-N22)*0.065; (S12-S22)*0.065]*9.81;
FM3 = [-Af3; (S13+S23); -(N13+N23); Rm3; (N13-N23)*0.065; (S13-S23)*0.065]*9.81;

% CG = [Fx Fy Fz Mx My Mz] @cg
CG1 = Y*FM1;
CG2 = Y*FM2;
CG3 = Y*FM3;


% For lift curve slope
Cfx1 = (1/q1/S)*(-1)*CG1(1,1);   Cfy1 = (1/q1/S)*(-1)*CG1(2,1);   Cfz1 = (1/q1/S)*(-1)*CG1(3,1);
Cfx2 = (1/q1/S)*(-1)*CG2(1,1);   Cfy2 = (1/q1/S)*(-1)*CG2(2,1);   Cfz2 = (1/q1/S)*(-1)*CG2(3,1);
Cfx3 = (1/q1/S)*(-1)*CG3(1,1);   Cfy3 = (1/q1/S)*(-1)*CG3(2,1);   Cfz3 = (1/q1/S)*(-1)*CG3(3,1);

CL11 = sind(alpha)*Cfx1 - cosd(alpha)*Cfz1;
CL12 = sind(alpha)*Cfx2 - cosd(alpha)*Cfz2;
CL13 = sind(alpha)*Cfx3 - cosd(alpha)*Cfz3;

CD11 = -cosd(alpha)*Cfx1 - sind(alpha)*Cfz1;
CD12 = -cosd(alpha)*Cfx2 - sind(alpha)*Cfz2;
CD13 = -cosd(alpha)*Cfx3 - sind(alpha)*Cfz3;


% 5th element in array is Cmy
My1 = CG1(5,1);
My2 = CG2(5,1);
My3 = CG3(5,1);

% Cmy
Cmy11 = (1/q1/S/l)*My1;
Cmy12 = (1/q2/S/l)*My2;
Cmy13 = (1/q3/S/l)*My3;

