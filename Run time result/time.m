title('Balance')
aaaa=load('timebalancekstar.mat');
timekstartree=aaaa.timeT;
aa=load('timeknnbalance.mat');
timeknn=aa.timeT;
aaa=load('timektreebalance.mat')
timektree=aaa.timeT;
plot(1:10,timekstartree(1,:),'-.g*','DisplayName','kstar');
hold on;
plot(1:10,timektree(1,:),'--mo','DisplayName','ktree');
plot(1:10,timeknn,':bs','DisplayName','knn');
xlabel('itration') % x-axis label
ylabel('running cost(time)') % y-axis label
hold on;


grid on;
title('Blance200sample')
xlabel('itration') % x-axis label
ylabel('running cost(time)') % y-axis label
legend('show');