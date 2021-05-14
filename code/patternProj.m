dataSet = load('balance.txt');
% Gisette = load('gisette_train.txt');
% Gisette_labels=load('gisette_train.labels.txt');
% Madelon_labels=load('madelon_train.labels.txt');


X=dataSet';
[d n]=size(X);
S=zeros(d,d);
EdisMatrix=zeros(d,d);
k=3;
for i=1:d
    for j=1:d
        x1=X(i,:);
        x1=x1';
        x2=X(j,:);
        x2=x2';
        ED=Edistance(x1, x2);
        EdisMatrix(i,j)= ED;
    end
end



knnFeatureVec=zeros(d,k);
for i=1:d
    edVector=EdisMatrix(i,:);
    [sortedValues,sortIndex] = sort(edVector,'descend');  %# Sort the values in
    %#   descending order
    maxIndex = sortIndex(:,1:k);
    knnFeatureVec(i,:)=maxIndex(:) ;
    x1=X(i,:);
    x1=x1';
    for j=1:k
        indx=knnFeatureVec(i,j);
        x2=X(indx,:);
        x2=x2';
        
        v1=var(x1);
        v2=var(x2);
        sigma=(v1+v2)/2;
        
        S(i,indx)=RBF(x1,x2,sigma);
        
    end
    
    
end



sumS=sum(S);
D=zeros(d,d);
for i=1:d
    D(i,i)=sumS(i);
end

L=D-S;

