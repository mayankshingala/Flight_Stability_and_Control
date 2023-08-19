%% MAIN_Q1

close all
clear all
clc

v0 = 20; % m/s
x0 = 0; % m
y0 = 3000; % m

launch_all = [0 , 5, 10];

for i = 1:3
    launch = launch_all(i);
    gamma_0 = deg2rad(launch); % rad

states0 = [v0, gamma_0, x0, y0];

[t,y] = RK4(@pointMassModel, 50, 0.01, states0);

figure(i);

subplot(4,1,1);
plot(t,y(:,3),'r');
% xlim([0 25])
ylabel('x');
grid on

subplot(4,1,2);
plot(t,y(:,4),'r');
% xlim([0 25])
ylabel('y');
grid on

subplot(4,1,3);
plot(t,y(:,1),'r');
% xlim([0 25])
ylabel('v');
grid on

subplot(4,1,4);
plot(t,y(:,2),'r');
% xlim([0 25])
ylabel('\gamma');
xlabel('t');
grid on

% figure(i);
% 
% if i==1
%     title("\gamma_0 = 0^\circ");
% else if i==2
%         title("\gamma_0 = 5^\circ");
% else
%     title("\gamma_0 = 10^\circ");
% end

end
