clear all
close all
clc

%% Given Data
x_cg1 = 1.2061;
x_cg2 = 1.1698;
x_cg3 = 1.1335;
x_cg4 = 1.0972;

x1 = [0.561920037, 0.464396725, 0.390222248, 0.332497063, 0.286693896]; 
y1 = [0.034810312, 0.043954803, 0.050909939, 0.05632267, 0.060617506];

x2 = [0.561920037, 0.464396725, 0.390222248, 0.332497063, 0.286693896]; 
y2 = [0.016740062, 0.029020713, 0.038361154, 0.045630214, 0.051397991]; 

x3 = [0.561920037, 0.464396725, 0.390222248, 0.332497063, 0.286693896]; 
y3 = [-0.001330187, 0.014086622, 0.02581237, 0.034937759, 0.042178476]; 

x4 = [0.561920037, 0.464396725, 0.390222248, 0.332497063, 0.286693896]; 
y4 = [-0.019400436, -0.000847468, 0.013263586, 0.024245304, 0.032958961]; 

x = [x1; x2; x3; x4];
y = [y1; y2; y3; y4];

% figure(1)
figure('Name','Neutral Point Estimation');
plot(x(1,1:5),y(1,1:5), 'pentagram-r')
hold on
plot(x(2,1:5),y(2,1:5), 'o-g')
hold on
plot(x(3,1:5),y(3,1:5), 'square-b')
hold on
plot(x(4,1:5),y(4,1:5), '^-m')
hold on

xlim([0, 1])
ylim([-0.025, 0.1])
grid on

%% If coordinates are needed in plot
% for i=1:4
%   for j=1:5
%     textString = sprintf('(%.4f,\n%.4f)', x(i,j), y(i,j));
%     text(x(i,j)-0.002, y(i,j)+0.005, textString, 'FontSize', 7);
%     hold on;
%   end
% end

%% %%%%%%%%%%%%%%%%%%%

p1 = polyfit(x1,y1,1);              % Finding slope and y axis intercept of line
p1(1);                              % Slope of Line
p1(2);                              % y intercept
CL_trim_1 = -p1(2)/p1(1);           % Trim angle of attack (x intercept)

x11 = [0, x1(5)];
y11 = p1(1)*x11 + p1(2);

x12 = [x1(1), CL_trim_1 + 0.1];
y12 = p1(1)*x12 + p1(2);

%%%%%%%%%%%%%%%%%%%%%

p2 = polyfit(x2,y2,1);
p2(1);    % Slope of Line
p2(2);    % y intercept
CL_trim_2 = -p2(2)/p2(1);

x21 = [0, x2(5)];
y21 = p2(1)*x21 + p2(2);

x22 = [x2(1), CL_trim_2 + 0.1];
y22 = p2(1)*x22 + p2(2);

%%%%%%%%%%%%%%%%%%%%%

p3 = polyfit(x3,y3,1);
p3(1);    % Slope of Line
p3(2);    % y intercept
CL_trim_3 = -p3(2)/p3(1);

x31 = [0, x3(5)];
y31 = p3(1)*x31 + p3(2);

x32 = [x3(1), CL_trim_3 + 0.1];
y32 = p3(1)*x32 + p3(2);

%%%%%%%%%%%%%%%%%%%%%%%

p4 = polyfit(x4,y4,1);
p4(1);    % Slope of Line
p4(2);    % y intercept
CL_trim_4 = -p4(2)/p4(1);

x41 = [0, x4(5)];
y41 = p4(1)*x31 + p4(2);

x42 = [x4(1), CL_trim_4 + 0.1];
y42 = p4(1)*x42 + p4(2);

%%%%%%%%%%%%%%%%%%%%%%%

plot([0, CL_trim_1 + 0.1],[0, 0],'k')
hold on

plot(x11,y11,'--r',x12,y12,'--r')
hold on
plot(x21,y21,'--g',x22,y22,'--g')
hold on
plot(x31,y31,'--b',x32,y32,'--b')
hold on
plot(x41,y41,'--m',x42,y42,'--m')
hold off

title('δe_t_r_i_m v/s (C_L_t_r_i_m - Cl_0)    **Neutral Point Estimation**')
xlabel('Coefficient of Lift [C_L_ _t_r_i_m - C_L_0]')
ylabel('Elevator deflection [δe_t_r_i_m]')
legend({'x_c_g1 = 1.2061 m','x_c_g2 = 1.1698 m','x_c_g3 = 1.1335 m','x_c_g4 = 1.0972 m'},'Location','northeast')

%%%%%%%%%%%%%%%%%%%%%%%

% figure(2)
figure('Name','Neutral Point Estimation');
x_cg = [x_cg1, x_cg2, x_cg3, x_cg4];
de_Cl = [p1(1), p2(1), p3(1), p4(1)];

plot(x_cg,de_Cl, '*-r')
hold on

%%%%%%%%%%%%%%%%%%%

p5 = polyfit(x_cg,de_Cl,1);
p5(1);    % Slope of Line
p5(2);    % y intercept
x_np = -p5(2)/p5(1);
x_npr = round(x_np,4);
fprintf('The neutral point (x_np) of aircraft is at %.4f m from leading edge of mean aerodynamic chord.\n', x_npr);

%%%%%%%%%%%%%%%%%%%

x_cg_1 = [x_cg(4) - 0.1, x_cg(4)];
de_Cl_1 = p5(1)*x_cg_1 + p5(2);

x_cg_2 = [x_cg(1), x_np + 0.05];
de_Cl_2 = p5(1)*x_cg_2 + p5(2);

%%%%%%%%%%%%%%%%%%%

plot([x_cg(4) - 0.1, x_np + 0.05],[0, 0],'k')
hold on
plot(x_cg_1,de_Cl_1,'--r',x_cg_2,de_Cl_2,'--r')
hold on
plot(x_np,0,'pentagramb')
xlim([x_cg(4) - 0.1, x_np + 0.05])
ylim([-0.025, 0.1])
grid on

title('∂δe/∂C_L v/s x_c_g    **Neutral Point Estimation**')
xlabel('Location of C.G. from leading edge of mean aerodynamic chord [x_c_g in m]')
ylabel('(∂δe/∂C_L)_t_r_i_m')

%% If coordinates are needed in plot
for i=1:4
    textString = sprintf('(%.4f, %.4f)', x_cg(i), de_Cl(i));
    text(x_cg(i), de_Cl(i)-0.009, textString, 'FontSize', 10);
    hold on;
end

textString = sprintf('x_n_p = \n%.4f', x_np);
text(x_np, -0.025, textString, 'FontSize', 10);

hold off
