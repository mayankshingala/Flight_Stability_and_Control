%% Neutral Point estimation for Body alone configuration
clc
clear all
close all

% Geometrical data (constant)
q = 963.625;         % for 1st velocity
S = 0.009677;
l = 0.884;
Q1 = 1/q/S;
Q2 = 1/q/S/l;

% Balance center location(m)
% x = -0.465;
y = 0;
z = 0;

% Measured Voltage signal
CM = [63.080043	0.144499	-0.206795	1.354260	1.630051	4.275882
-0.123649	150.309342	0.592082	-0.725847	0.030856	0.393628
0.024098	-0.689773	151.831777	0.096597	-0.571799	-4.414537
0.152944	-2.334107	0.037781	77.595997	0.445712	5.841784
-0.006030	0.114642	-0.574072	-0.065800	79.176337	0.322466
0.047415	0.466131	0.099431	0.208017	0.190935	44.877349];

% No wind data
NW = [-0.000122	-0.000856	0.000737	-0.000887	-0.000321	0.000540];
NW = NW';

% k = [Pitch af	n1	n2	s1	s2	rm]
% Data for 40 m/s
k = [-9.947917	0.004041	0.010666	-0.025613	0.000252	-0.001648	0.000556
-8.052083	0.004303	0.008047	-0.019603	0.000321	-0.00189	0.000534
-6.052083	0.004447	0.00559	-0.013974	0.000369	-0.002227	0.000534
-4.0625	0.004555	0.003472	-0.00907	0.000284	-0.002226	0.000534
-2.0625	0.004576	0.001695	-0.004794	0.000163	-0.002093	0.00055
-0.052083	0.004651	0.000305	-0.001106	0.00012	-0.002148	0.000567
0.052083	0.004584	0.000547	-0.001454	0.000067	-0.00203	0.000546
1.947917	0.004693	-0.000915	0.002245	-0.000069	-0.001849	0.000555
3.947917	0.004635	-0.002199	0.005815	-0.000038	-0.001871	0.000523
5.947917	0.004555	-0.003961	0.010213	-0.00002	-0.002064	0.00051
7.947917	0.004402	-0.006041	0.015162	0.000073	-0.002172	0.00051
9.947917	0.004198	-0.008423	0.020711	0.000142	-0.002359	0.000489
11.947917	0.003985	-0.011058	0.026797	0.000099	-0.002414	0.000472
13.947917	0.003639	-0.013887	0.033287	-0.000001	-0.002484	0.000497
15.9375	0.00319	-0.016762	0.040025	-0.000171	-0.002655	0.000532
17.947917	0.002619	-0.019732	0.046936	-0.000346	-0.002734	0.000544
19.947917	0.002035	-0.022735	0.05403	-0.000156	-0.003364	0.000573
21.947917	0.001441	-0.025527	0.060936	0.000338	-0.004356	0.000604
23.947917	0.000957	-0.028028	0.067456	0.000961	-0.005535	0.000605
25.947917	0.000578	-0.0304	0.073778	0.00176	-0.006996	0.000559];

a = transpose(k);
v = [a(2,:); a(3,:); a(4,:); a(5,:); a(6,:); a(7,:)];       % a = [af;	n1;	n2;	s1;	s2;	rm] (6x20)

alpha_dummy = [];
Cmy_dummy1=[];
Cmy_dummy2=[];
Cmy_dummy3=[];
Cmy_dummy4=[];
Cmy_dummy5=[];
Cmy_dummy6=[];
Cmy_dummy7=[];
Cmy_dummy8=[];
Cmy_dummy9=[];
Cmy_dummy10=[];

x = [-0.465:0.093:(0.465-0.093)];       % The CG is varied from 0.45 to -0.45 to find NP of configuration

        y1 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(1) 0 1 0; -y x(1) 0 0 0 1];
        y2 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(2) 0 1 0; -y x(2) 0 0 0 1];
        y3 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(3) 0 1 0; -y x(3) 0 0 0 1];
        y4 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(4) 0 1 0; -y x(4) 0 0 0 1];
        y5 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(5) 0 1 0; -y x(5) 0 0 0 1];
        y6 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(6) 0 1 0; -y x(6) 0 0 0 1];
        y7 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(7) 0 1 0; -y x(7) 0 0 0 1];
        y8 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(8) 0 1 0; -y x(8) 0 0 0 1];
        y9 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(9) 0 1 0; -y x(9) 0 0 0 1];
        y10 = [-1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 -z y 1 0 0; z 0 -x(10) 0 1 0; -y x(10) 0 0 0 1];

for i = 1:1:20

    af = v(1,i);
    n1 = v(2,i);
    n2 = v(3,i);
    s1 = v(4,i);
    s2 = v(5,i);
    rm = v(6,i);

    a = [af; n1; n2; s1; s2; rm];
    alpha = k(:,1);

    A = CM*[a - NW];      % A=[Ax;N1;N2;S1;S2;Rm] in kg and kg-m    
    Af = A(1);    
    N1 = A(2);    
    N2 = A(3);    
    S1 = A(4);    
    S2 = A(5);   
    Rm = A(6);

    % Transform the forces and moments to the body axis
    % FM = [fx; fy; fz; mx; my; mz]
    FM = [Af; (S1+S2); (N1+N2); Rm; (N1-N2)*0.065; (S1-S2)*0.065]*9.81;

    % Transform the forces and moments to the C.G the flight vehicle
    % CG = [Fx Fy Fz Mx My Mz] @cg
    CG1 = y1*FM;
    CG2 = y2*FM;
    CG3 = y3*FM;
    CG4 = y4*FM;
    CG5 = y5*FM;
    CG6 = y6*FM;
    CG7 = y7*FM;
    CG8 = y8*FM;
    CG9 = y9*FM;
    CG10 = y10*FM;

    % Mxyz = [Mx My Mz]
    Mxyz1 = CG1(4:6,1);
    Mxyz2 = CG2(4:6,1);
    Mxyz3 = CG3(4:6,1);
    Mxyz4 = CG4(4:6,1);
    Mxyz5 = CG5(4:6,1);
    Mxyz6 = CG6(4:6,1);
    Mxyz7 = CG7(4:6,1);
    Mxyz8 = CG8(4:6,1);
    Mxyz9 = CG9(4:6,1);
    Mxyz10 = CG10(4:6,1);
    
    % Cmxyz = [Cmx Cmy Cmz]
    Cmxyz1 = (1/(q*S*l))*Mxyz1;
    Cmxyz2 = (1/(q*S*l))*Mxyz2;
    Cmxyz3 = (1/(q*S*l))*Mxyz3;
    Cmxyz4 = (1/(q*S*l))*Mxyz4;
    Cmxyz5 = (1/(q*S*l))*Mxyz5;
    Cmxyz6 = (1/(q*S*l))*Mxyz6;
    Cmxyz7 = (1/(q*S*l))*Mxyz7;
    Cmxyz8 = (1/(q*S*l))*Mxyz8;
    Cmxyz9 = (1/(q*S*l))*Mxyz9;
    Cmxyz10 = (1/(q*S*l))*Mxyz10;

    Cmy1 = Cmxyz1(2);
    Cmy2 = Cmxyz2(2);
    Cmy3 = Cmxyz3(2);
    Cmy4 = Cmxyz4(2);
    Cmy5 = Cmxyz5(2);
    Cmy6 = Cmxyz6(2);
    Cmy7 = Cmxyz7(2);
    Cmy8 = Cmxyz8(2);
    Cmy9 = Cmxyz9(2);
    Cmy10 = Cmxyz10(2);

    Cmy_dummy1 = [Cmy_dummy1, Cmy1];
    Cmy_dummy2 = [Cmy_dummy2, Cmy2];
    Cmy_dummy3 = [Cmy_dummy3, Cmy3];
    Cmy_dummy4 = [Cmy_dummy4, Cmy4];
    Cmy_dummy5 = [Cmy_dummy5, Cmy5];
    Cmy_dummy6 = [Cmy_dummy6, Cmy6];
    Cmy_dummy7 = [Cmy_dummy7, Cmy7];
    Cmy_dummy8 = [Cmy_dummy8, Cmy8];
    Cmy_dummy9 = [Cmy_dummy9, Cmy9];
    Cmy_dummy10 = [Cmy_dummy10, Cmy10];

    alpha_dummy = [alpha_dummy, alpha];

end    

figure('Name','Neutral Point estimation for Bomb Model-II_Body_TF_0','NumberTitle','off')
plot(alpha_dummy,Cmy_dummy1)
hold on
plot(alpha_dummy,Cmy_dummy2)
hold on
plot(alpha_dummy,Cmy_dummy3)
hold on
plot(alpha_dummy,Cmy_dummy4)
hold on
plot(alpha_dummy,Cmy_dummy5)
hold on
plot(alpha_dummy,Cmy_dummy6)
hold on
plot(alpha_dummy,Cmy_dummy7)
hold on
plot(alpha_dummy,Cmy_dummy8)
hold on
plot(alpha_dummy,Cmy_dummy9)
hold on
plot(alpha_dummy,Cmy_dummy10)
hold off
title('Neutral point estimation for (6682 Bomb Model-II Body + TF) using C_m_y v/s α')
grid on
xlabel('α (deg)')
ylabel('C_M_y')
legend({'x1','x2','x3','x4','x5','x6','x7','x8','x9','x10'},'Location','northwest','NumColumns',2)

y_text_location = [Cmy_dummy1(20), Cmy_dummy2(20), Cmy_dummy3(20), Cmy_dummy4(20), Cmy_dummy5(20),...
        Cmy_dummy6(20), Cmy_dummy7(20), Cmy_dummy8(20), Cmy_dummy9(20), Cmy_dummy10(20)]

for i=1:10
    j = i-1;
    x(i) = -0.465 + i*0.093
    textString = sprintf('x = %.4f', x(i));
    text(26.5, y_text_location(i), textString, 'FontSize', 10);
    hold on;
end
