function [timeT,acc]=ktree(trainX,testX,label_train,label_real_test,P1,P2,kfeature)
% trainX=load('balance.txt');

L=CalculateL(trainX,kfeature);
w=opt(L,trainX,P1,P2);

[n d]=size(trainX)
for i=1:n
    c=0;
   for j=1:n
        if w(j,i) > 0.00001
           
            c=c+1;
        
        end
   end
    label(i)=c;
end

y=label(i);



%  label_train=load('madelon_train.labels.txt');
% testX = trainX(1:200,:);
% data_label=load('balance_label.txt');
% label_train=data_label(:,1);
X=trainX';
[d n]=size(X);

% for i=1:625
%     c=0;
%    for j=1:625
%         if matrix2(j,i) > 0.00001
%            
%             c=c+1;
%         
%         end
%    end
%     label(i)=c;
% end


vars ={};
for i=1:d
    %v=X(i,:)='s'+i;
    s = num2str(i);
  vars(i) = {s};
end

label=label';
% for k=1:n
%     
%       labelString(k) = num2str(label(k));
% end
y=label;
%# train classification decision tree
t = classregtree(trainX, y, 'method','classification',...
    'names',vars);
%                 'categorical',[2 4], 'prune','off');
% view(t)

% 
%# predict a new unseen instance
ntest=size(testX,1);
for h=1:ntest
    inst=testX(h,:);

K(h) = eval(t, inst)  ;
end

tic;
 label_test=knn(trainX,K,testX,label_train);
 aaa=toc;
 timeT=aaa;
%  label_real_test=label_train(1:200,:);
 num=0;
 ntest=size(testX,1);
 for i=1:ntest
     if label_test(i)==label_real_test(i)
         num=num+1;
     end
 end
 acc=num/ntest;
end     
     