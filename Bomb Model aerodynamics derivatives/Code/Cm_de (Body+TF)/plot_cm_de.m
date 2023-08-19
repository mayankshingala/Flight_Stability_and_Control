de = [-25;-20;-15;-10;-5;0;5;+10;15;20;25];

Cmy_1 = [Cmy111 Cmy91 Cmy71 Cmy51 Cmy31 Cmy11 Cmy21  Cmy41 Cmy61 Cmy81 Cmy101];
Cmy_2 = [Cmy112 Cmy92 Cmy72 Cmy52 Cmy32 Cmy12 Cmy22  Cmy42 Cmy62  Cmy82 Cmy102];
Cmy_3 = [Cmy113 Cmy93 Cmy73 Cmy53 Cmy33 Cmy13 Cmy23  Cmy43 Cmy63 Cmy83 Cmy103];

CL_1 = [CL111 CL91 CL71 CL51 CL31 CL11 CL21  CL41 CL61 CL81 CL101];
CL_2 = [CL112 CL92 CL72 CL52 CL32 CL12 CL22  CL42 CL62 CL82 CL102];
CL_3 = [CL113 CL93 CL73 CL53 CL33 CL13 CL23  CL43 CL63 CL83 CL103];

% CD_1 = [CD111 CD91 CD71 CD51 CD31 CD11 CD21  CD41 CD61 CD81 CD101];
% CD_2 = [CD112 CD92 CD72 CD52 CD32 CD12 CD22  CD42 CD62 CD82 CD102];
% CD_3 = [CD113 CD93 CD73 CD53 CD33 CD13 CD23  CD43 CD63 CD83 CD103];

% figure(1)
figure('Name','Bomb Model-II Body+TF','NumberTitle','off');
plot(de, CL_1,'|-b')
hold on
plot(de, CL_2,'o-g')
hold on
plot(de, CL_3,'.-k')
hold off
grid on
title({'Bomb Model-II Body + TF','C_L vs δe'})
xlabel('δe (deg)')
ylabel('C_L')
legend({'v = 40 m/s','v = 50 m/s','v = 60 m/s'},'Location','northwest')

% % figure(2)
% figure('Name','Bomb Model-II Body+TF','NumberTitle','off');
% plot(de,CD_1,'|-b')
% hold on
% plot(de,CD_2,'o-g')
% hold on
% plot(de,CD_3,'.-k')
% hold off
% grid on
% title({'Bomb Model-II Body + TF','C_D vs δe'})
% xlabel('δe (deg)')
% ylabel('C_D')
% legend({'v = 40 m/s','v = 50 m/s','v = 60 m/s'},'Location','northwest')

% figure(3)
figure('Name','Bomb Model-II Body+TF','NumberTitle','off');
plot(de,Cmy_1,'|-b')
hold on
plot(de,Cmy_2,'o-g')
hold on
plot(de,Cmy_3,'.-k')
hold off
grid on
title({'Bomb Model-II Body + TF','C_m vs δe'})
xlabel('δe (deg)')
ylabel('C_m')
legend({'v = 40 m/s','v = 50 m/s','v = 60 m/s'},'Location','northeast')

p11 = polyfit(de,CL_1,1);
m11 = p11(1)*(180/pi);
p12 = polyfit(de,CL_2,1);
m12 = p12(1)*(180/pi);
p13 = polyfit(de,CL_3,1);
m13 = p13(1)*(180/pi);

fprintf('CL_de = %.4f /rad or %.4f /deg (v = 40 m/s)\n', p11(1), m11)
fprintf('CL_de = %.4f /rad or %.4f /deg (v = 50 m/s)\n', p12(1), m12)
fprintf('CL_de = %.4f /rad or %.4f /deg (v = 60 m/s)\n', p13(1), m13)

p21 = polyfit(de,Cmy_1,1);
m21 = p21(1)*(180/pi);
p22 = polyfit(de,Cmy_2,1);
m22 = p22(1)*(180/pi);
p23 = polyfit(de,Cmy_3,1);
m23 = p23(1)*(180/pi);

fprintf('Cm_de = %.4f /rad or %.4f /deg (v = 40 m/s)\n', p21(1), m21)
fprintf('Cm_de = %.4f /rad or %.4f /deg (v = 50 m/s)\n', p22(1), m22)
fprintf('Cm_de = %.4f /rad or %.4f /deg (v = 60 m/s)\n', p23(1), m23)