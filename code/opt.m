function [w]=opt(L,X,P1,P2)
% X = load('balance.txt');


% y=load('madelon_train.labels.txt');

X=X';
[d n]=size(X);
w=ones(n,n);
t=1;
%P1=0.001;
%P2=0.001;
% GGG=load('lbalance.mat');
% L=GGG.L;
j_old=inf;
j=norm(X*w-X)+P1*norm(w,1)+trace(w'*X'*L*X*w);
flag=1;
while(abs(j_old-j>0.01))
    
    j_old=j;
  for i=1:n 
    for k=1:n
        dioagvector(k)=(1/abs(w(k,i)));
    end
    D=diag(dioagvector);
    w(:,i)=inv(X'*X-P1*D+P2*X'*L*X)*(X'*X(:,i));
  end 
  j=norm(X*w-X)+P1*norm(w,1)+trace(w'*X'*L*X*w);
  t=t+1;
end
end