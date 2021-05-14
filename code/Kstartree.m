function [timeT,acc]=Kstartree(trainX,testX,label_train,label_real_test,P1,P2,kfeature)
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
    label(i)=c-1;
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
uniqe_k=unique(y);
num_k=size(uniqe_k,1);
matrix1=zeros(num_k,n);
for r=1:num_k
    k=uniqe_k(r);
     index=find(ismember(y,k));
     for i=1:length(index)
        matrix1(r,i) =index(i);
     end
end

ntest=size(testX,1);
for h=1:ntest
    inst=testX(h,:);

K(h) = eval(t, inst)  ;
kkk=K(h);
testk=cell2mat(kkk);
testk=str2num(testk);
 rr=find(ismember(uniqe_k,testk));
% for u=1:num_k
%     if(uniqe_k(u)==testk)
%      rr=u;   
%     end
% end
vectorX1=matrix1(rr,:);
vectorX1(find(vectorX1==0)) = [];
index_xt=onn_nn_X(trainX,inst,vectorX1);
%%% calculate matrix X' AS matrix22

%for i=1:testk
    optk_w=w(:,index_xt);
    f=0;
    for j=1:length(optk_w)
        if(j~=index_xt)
            if(optk_w(j)> 0.00001)
                f=f+1;
                matrix22(f)=j;
                
            end
        end
    end
    
%end
%%% calculate matrix X'' as matrix3
%for i=1:testk
    for j=1:testk
        point_in=matrix22(j);
        point=trainX(point_in,:);
        a=one_nn(trainX,point);
        matrix3(j)=a;
        
    end
%end
index_xt
index_total=[index_xt;matrix22';matrix3'];
new_data_train=trainX(index_total,:);
new_label_train=label_train(index_total,:);
tic;
label_test(h)=knnStar(new_data_train,testk,inst,new_label_train);
a=toc;
ttt(h)=a;
matrix22=[];
matrix3=[];
end
timeT=sum(ttt)/ntest;
    






 
 
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
     