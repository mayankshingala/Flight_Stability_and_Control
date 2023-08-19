%% PARAMETERS

% Geometric & Inertial properties
m = 750;
g = 9.81;
Ixx = 873;
Iyy = 907;
Izz = 1680;
Ixz = 1144;
S = 12.47;
b = 10.47;
cbar = 1.211;
AR = 8.8;

% Aerodynamic parameters
% Longitudinal
CD_0 = 0.035;   k = 0.045;
CL_0 = 0.37;    CL_alpha = 5;       CL_q = 37.211;  CL_de = 0.374; 
CM_0 = 0.091;   CM_alpha = -2.937;  CM_q = -8.719;  CM_de = -0.735;

%
CY_0 = 0;       CY_beta = -0.531;   CY_p = -0.0571;
CY_r = 0.4657;  CY_delr = 0.1502;

%
Cl_0 = 0;       Cl_beta = -0.031;   Cl_p = -0.262;  Cl_r = -0.0541;
Cl_delr = 0.005;  Cl_dela = -0.153;

%
Cn_0 = 0;       Cn_beta = 0.01;     Cn_p = -0.007;  Cn_r = -0.067;
Cn_delr = -0.047;
