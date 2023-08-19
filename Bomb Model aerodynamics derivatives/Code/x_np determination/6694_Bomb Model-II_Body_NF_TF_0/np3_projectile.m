%% Neutral Point estimation for Body alone configuration
clc
clear all
close all

% Geometrical data (constant)
q = 980.386364;         % for 1st vaelocity
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
NW = [-0.00006	0.00072	-0.000535	-0.000702	0.000175	-0.000938];
NW = NW';

% k = [Pitch af	n1	n2	s1	s2	rm]
% Data for 40 m/s
k = [-9.947917	0.005824	-0.01873	-0.003349	-0.00012	-0.000445	-0.000447
-8.052083	0.005779	-0.01847	0.00078	0.000486	-0.001005	-0.000446
-6.052083	0.005848	-0.015727	0.002675	0.001113	-0.001597	-0.000533
-4.052083	0.005919	-0.010716	0.002267	0.001595	-0.002072	-0.00061
-2.052083	0.006174	-0.005618	0.001225	0.00203	-0.002352	-0.000731
-0.052083	0.006382	0.000178	-0.000973	0.002233	-0.002247	-0.000805
0.052083	0.006418	0.000622	-0.001537	0.002333	-0.002409	-0.000828
1.947917	0.006301	0.005986	-0.003291	0.002541	-0.002314	-0.000872
3.947917	0.006	0.011205	-0.004648	0.00276	-0.002287	-0.000951
5.947917	0.005786	0.016277	-0.005346	0.003033	-0.002387	-0.001062
7.947917	0.00565	0.020372	-0.004799	0.003231	-0.002487	-0.001154
9.958333	0.005792	0.020911	-0.001107	0.003629	-0.002522	-0.001206
11.947917	0.005782	0.019842	0.004121	0.003848	-0.002633	-0.001215
13.947917	0.005569	0.018813	0.009425	0.004079	-0.002668	-0.001259
15.947917	0.005211	0.017681	0.014868	0.004138	-0.002628	-0.00126
17.947917	0.004741	0.017236	0.020059	0.004069	-0.002389	-0.001278
19.947917	0.004227	0.016561	0.025673	0.003951	-0.002322	-0.001245
21.947917	0.003654	0.016103	0.031224	0.003849	-0.002502	-0.001226
23.947917	0.00305	0.016164	0.036243	0.003657	-0.002624	-0.00124
25.947917	0.002483	0.016457	0.040852	0.00412	-0.003231	-0.001296];

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

figure('Name','Neutral Point estimation for Bomb Model-II_Body_NF_TF_0','NumberTitle','off')
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
title('Neutral point estimation for (6694 Bomb Model-II Body + NF + TF) using C_m_y v/s α')
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
