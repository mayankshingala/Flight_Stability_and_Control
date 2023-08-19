
% DENSITY
function rho = DENSITY(h)

% calculates the air density between 0-5 km altitude
rho0 = 1.225; % kg/m^3
H0 = 10400; %m (scale height)
rho = rho0*exp(-h/H0);

end


% function rho = DENSITY(hg)
% 
% hg1=0;              % Gradient layer 1-2 (0 to 11 km)
% T1=288.16;
% a1=-0.0065;
% 
% p1=101325;  % in pascal at MSL (Mean Sea Level)
% d1=1.225;   % in kg/m3 at MSL
% g0=9.81;    %gravitational acceleration at MSL
% R=287;      %in J/kgK
% 
% r=6371000;                                  % Radius of earth
% 
% h=(r*hg)/(r+hg);                            % Calculation for Geopotential altitude
% h1=(r*hg1)/(r+hg1);                      % Geo potential ALT CALC
% T=T1+(a1*delh);                          % TEMP CALC
% d=d1*((T/T1)^((-g0/(a1*R))-1));          % DENS CALC
% 
% rho = d;
% 
% end