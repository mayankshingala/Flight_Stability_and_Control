function control_inputs = CS_DEF(t,~)

thrust = 869.4045;
dele_trim = 0.2105;   % rad
dela_trim = 0;          % rad
delr_trim = 0;          % rad

% 3-2-1-1 inputs
if t < 1
    offset = 0; % rad
elseif t < 4
    offset = 0.02; % rad
elseif t < 6
    offset = -0.02; % rad
elseif t < 7
    offset = 0.02; % rad
elseif t < 8
    offset = -0.02; % rad
else
    offset = 0; % rad
end

% % doublet inputs
% if t < 1
%     offset = 0; % rad
% elseif t < 3
%     offset = 0.02; % rad    
% elseif t < 5
%     offset = -0.02; % rad
% else
%     offset = 0; % rad
% end

% % sinusoidal inputs
% offset = 0.02*sin(pi/2*t); % rad

% dele = dele_trim;
dele = dele_trim + offset;
% dela = dela_trim;
dela = dela_trim + offset;
% delr = delr_trim;
delr = delr_trim + offset;

control_inputs = [dele, dela, delr, thrust];

end