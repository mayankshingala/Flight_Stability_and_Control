%% PLOTTING

figure(1);
% title('3-2-1-1 input to elevator')

subplot(6,2,1);
plot(t,y(:,1),'r');
ylabel('u');

subplot(6,2,3);
plot(t,y(:,2),'r');
ylabel('v');

subplot(6,2,5);
plot(t,y(:,3),'r');
ylabel('w');

subplot(6,2,7);
plot(t,y(:,7),'r');
ylabel('p');

subplot(6,2,9);
plot(t,y(:,8),'r');
ylabel('q');

subplot(6,2,11);
plot(t,y(:,9),'r');
ylabel('r');
xlabel('t')

subplot(6,2,2);
plot(t,y(:,10),'r');
ylabel('\phi');

subplot(6,2,4);
plot(t,y(:,11),'r');
ylabel('\theta');

subplot(6,2,6);
plot(t,y(:,12),'r');
ylabel('\psi');

subplot(6,2,8);
plot(t,c(:,1),'r');
ylabel('\delta_e');

subplot(6,2,10);
plot(t,c(:,2),'r');
ylabel('\delta_a');

subplot(6,2,12);
plot(t,c(:,3),'r');
ylabel('\delta_r');
xlabel('t')

