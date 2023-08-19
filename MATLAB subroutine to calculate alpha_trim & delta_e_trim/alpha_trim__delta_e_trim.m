clear all
close all
clc

%% Input Data
fprintf("Enter the required data to calculate the elevator deflection to the corresponding angle of attack\n")
W = input("Weight of ACFT (in _kg) = ");
W = W*9.81;
V = input("Cruise velocity (in m/s) = ");

% Geometrical data
%b = input("wing span in m")
S = input("Wing area (in m_2) = ");
%C_bar = input("Length of Mean Aerodynamic Chord (in m^2) = ");

% Aerodynamic parameters input
% AOA = Angle of attack of wing (a)
CL_0 = input("Lift coefficient at zero AOA, C_L0 = ");
CL_a = input("Slope of lift coeficient v/s AOA (in per radian) ∂Cl/∂α, Cl_α = ");
CL_de = input("Slope of lift coeficient v/s elevator deflection (in per radian) ∂Cl/∂δe, Cl_δe = ");
% Cd_0 = input("Drag coefficient at zero AOA = Cd_0")
Cm_0 = input("Coefficient at Moment at zero AOA, Cm_0 = ");
Cm_a = input("Slope of Moment coeficient v/s AOA (in per radian) ∂Cm/∂α, Cm_α = ");
Cm_de = input("Slope of Moment coeficient v/s Elevator deflection (in per radian) ∂Cm/∂δe, Cm_δe = ");

%% MATLAB ISA (INTERNATIONAL STANDARD ATMOSPHERE) to calculate density
% Followed SI units (Height in meters, Temperature in Kelvin, Pressure in pascal, Density in kg/m^3)
r = 6371000;            % Radius of earth (in m)
hG = input("Altitude (in meters) = ");         % Geometric altitude
h = (r/(r+hG))*hG;     % Conversion from Geometric to Geopotential altitude

h1 = 0;                 % Gradient layer 1-2 (0 to 11 km)
T1 = 288.16;
a1 = -0.0065;

h2 = 11000;             % Isothermal layer 2-3 (11 to 25 km)
T2 = 216.66;

h3 = 25000;             % Gradient layer 3-4 (25 to 47 km)
T3 = 216.66;
a3 = 0.003;

h4 = 47000;             % Isothermal layer 4-5 (47 to 53 km)
T4 = 282.66;

h5 = 53000;             % Gradient layer 5-6 (53 to 79 km)
T5 = 282.66;
a5 = -0.0045;

h6 = 79000;             % Isothermal layer 6-7 (79 to 90 km)
T6 = 165.66;

h7 = 90000;             % Gradient layer 7-8 (90 to 105 km)
T7 = 165.66;
a7 = 0.004;

h8 = 105000;
T8 = 225.66;

p1 = 101325;            % in pascal at MSL (Mean Sea Level)
d1 = 1.225;             % in kg/m3 at MSL
g0 = 9.81;              % gravitational acceleration at MSL
R = 287;                % in J/kgK

p2 = p1*((T2/T1)^(-g0/(a1*R)));     % Gradient
p3 = p2*exp(-(g0/(R*T3))*14000);    % Isothermal

p4 = p3*((T4/T3)^(-g0/(a3*R)));     % Gradient
p5 = p4*exp(-(g0/(R*T5))*6000);     % Isothermal

p6 = p5*((T6/T5)^(-g0/(a5*R)));     % Gradient
p7 = p6*exp(-(g0/(R*T6))*11000);    % Isothermal

p8 = p7*((T8/T7)^(-g0/(a7*R)));     % Gradient

if h <= h2                                 % GRAD layer 1-2
    dh = h - h1;
    T = T1 + (a1*dh);                      % TEMP CALC
    p = p1*((T/T1)^(-g0/(a1*R)));          % PRES CALC
    d = d1*((T/T1)^((-g0/(a1*R))-1));      % DENS CALC
 
elseif (h2 <= h) && (h <= h3)              % ISOTH layer 2-3 
    dh = h - h2;
    T = T2;
    p = p2*exp((-g0/(R*T))*dh);
    d2 = p2/(R*T);                         % DENS at altitude 11 km
    d = d2*exp((-g0/(R*T))*dh);

elseif (h3 <= h) && (h <= h4)              % GRAD layer 3-4
    dh = h - h3;
    T = T3 + (a3*dh);
    p = p3*((T/T3)^(-g0/(a3*R)));
    d3 = p3/(R*T3);
    d = d3*((T/T3)^((-g0/(a3*R))-1));

elseif (h4 <= h) && (h <= h5)              % ISOTH layer 4-5
    dh = h - h4;
    T = T4;
    p = p4*exp((-g0/(R*T4))*dh);
    d4 = p4/(R*T4);                        % DENS at altitude 47 km
    d = d4*exp((-g0/(R*T4))*dh);

elseif (h5 <= h) && (h <= h6)              % GRAD layer 5-6
    dh = h - h5;
    T = T5 + (a5*dh);
    p = p5*((T/T5)^(-g0/(a5*R)));
    d5 = p5/(R*T3);                        % DENS at altitude 53 km
    d = d5*((T/T5)^((-g0/(a5*R))-1));

elseif (h6 <= h) && (h <= h7)              % ISOTH layer 6-7
    dh = h - h6;
    T = T6;
    p = p6*exp((-g0/(R*T6))*dh);
    d6 = p6/(R*T6);                        % DENS at altitude 79 km
    d = d6*exp((-g0/(R*T6))*dh);

else (h7 <= h) && (h <= h8)                % GRAD layer 7-8
    dh = h - h7;
    T = T7+(a7*dh);
    p = p7*((T/T7)^(-g0/(a7*R)));
    d7 = p7/(R*T7);                        % DENS at altitude 90 km
    d = d7*((T/T7)^((-g0/(a7*R))-1));
end

%% Calculation of alpha_trim & deltae_trim
CL_trim = (2*W)/(S*d*V^2);

A = inv([CL_a, CL_de; Cm_a, Cm_de]) * [CL_trim - CL_0; -Cm_0];

a_trim = A(1)*(180/pi);             % Trim Angle of attack in degree
de_trim = A(2)*(180/pi);            % Trim elevator Deflaction in degree

fprintf('Trim Angle of attack (α_trim) = %.4f degree\n', a_trim)
fprintf('Trim Elevator deflection (δe_trim) = %.4f degree\n', de_trim)
