clc
clear all
close all

% Balance center location (m)
x = 0.02985;           % CG location for Body+TF case
y = 0;
z = 0;

% Geometrical data (constant)
S = 0.009677;
l = 0.884;

% Angle of Attack
alpha = 5.947917;
beta = 0;

% Consider AOA = 5.947917 degrees for Cm_δe analysis

CM =[63.080043	0.144499	-0.206795	1.354260	1.630051	4.275882
-0.123649	150.309342	0.592082	-0.725847	0.030856	0.393628
0.024098	-0.689773	151.831777	0.096597	-0.571799	-4.414537
0.152944	-2.334107	0.037781	77.595997	0.445712	5.841784
-0.006030	0.114642	-0.574072	-0.065800	79.176337	0.322466
0.047415	0.466131	0.099431	0.208017	0.190935	44.877349];

Y = [-1 0 0 0 0 0
    0 1 0 0 0 0
    0 0 -1 0 0 0
    0 -z y 1 0 0
    z 0 -x 0 1 0
    -y x 0 0 0 1];

tf_cm_de_1
tf_cm_de_2
tf_cm_de_3
tf_cm_de_4
tf_cm_de_5      % 6686_Bomb Model-II_Body_TF_-10
tf_cm_de_6      % 6687_Bomb Model-II_Body_TF_+15
tf_cm_de_7      % 6689_Bomb Model-II_Body_TF_-15
tf_cm_de_8      % 6690_Bomb Model-II_Body_TF_+20
tf_cm_de_9      % 6691_Bomb Model-II_Body_TF_-20
tf_cm_de_10     % 6692_Bomb Model-II_Body_TF_+25
tf_cm_de_11     % 6693_Bomb Model-II_Body_TF_-25

plot_cm_de
