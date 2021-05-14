Y=[0.8944 0.9389 0.9222;0.8525  0.9111 0.9083;0.8570 0.9148 0.9148];
h = bar(Y);
n = length(Y);
ll = cell(1,3);
ll{1}='180'; ll{2}='360';ll{3}='540';
 set(gca,'xticklabel', ll) 
colormap(summer(n));
grid on
l = cell(1,3);
l{1}='knn'; l{2}='ktree'; l{3}='k*tree';    
legend(h,l);
xlabel('sample size cliamate');
ylabel('accuracy');