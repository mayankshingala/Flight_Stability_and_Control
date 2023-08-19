
%     figure(1)
    figure('Name','6694_Bomb Model-II_Body_NF_TF','NumberTitle','off');
    subplot(3,1,1)
    plot(alpha_dummy,dummy1(1,1:20),'|-b')
    hold on
    plot(alpha_dummy,dummy1(1,21:40),'o-g')
    hold on
    plot(alpha_dummy,dummy1(1,41:60),'.-k')
    hold off
    grid on
    title({'6694 Bomb Model-II Body+NF+TF @ δ_e=0','C_L vs α'})
    ylabel('C_L')
    legend({'v = 40 m/s','v = 50 m/s','v = 60 m/s'},'Location','northwest')

%     figure(2)
    subplot(3,1,2)
    plot(alpha_dummy,dummy1(2,1:20),'|-b')
    hold on
    plot(alpha_dummy,dummy1(2,21:40),'o-g')
    hold on
    plot(alpha_dummy,dummy1(2,41:60),'.-k')
    hold off
    grid on
    title('C_D vs α')
    ylabel('C_D')
    legend({'v = 40 m/s','v = 50 m/s','v = 60 m/s'},'Location','northwest')

%     figure(3)
    subplot(3,1,3)
    plot(alpha_dummy,dummy1(3,1:20),'|-b')
    hold on
    plot(alpha_dummy,dummy1(3,21:40),'o-g')
    hold on
    plot(alpha_dummy,dummy1(3,41:60),'.-k')
    hold off
    grid on
    title('C_M vs α')
    xlabel('α (deg)')
    ylabel('C_M')
    legend({'v = 40 m/s','v = 50 m/s','v = 60 m/s'},'Location','southwest')

% end
