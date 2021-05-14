title('geman250')
aaaa=load('kstarblood240.mat');
timekstartree=aaaa.timeT;
aa=load('timeknnBlood240.mat');
timeknn=aa.timeT;
aaa=load('timektreeblood.mat');
timektree=aaa.timeT;
plot(1:10,timekstartree,'-.g*','DisplayName','kstar');
hold on;
plot(1:10,timektree,'--mo','DisplayName','ktree');
plot(1:10,timeknn,':bs','DisplayName','knn');
xlabel('itration') % x-axis label
ylabel('running cost(time)') % y-axis label
hold on;


grid on;
title('Blood240sample')
xlabel('itration') % x-axis label
ylabel('running cost(time)') % y-axis label
legend('show');