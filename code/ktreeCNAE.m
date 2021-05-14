
dl = load('CNAE.data.txt');

dataSet_labels = dl(:,end);
dataSet=dl(:,1:end-1);


P1=0.01;
P2=0.01;
kf=[100 140 200];

wholeDataSet=[dataSet dataSet_labels];
[n d]=size(dataSet);
omit=mod(n,2);
fl=wholeDataSet((n-omit)+1:n, :);
newSize= n-omit;
fold=newSize/2;
newTrainX=wholeDataSet(1:newSize,:);

 
for f=1:3
  
    kfeature=kf(f);

for t=1:2
    shuffledX = newTrainX(randperm(size(newTrainX,1)),:);
    
for i=1:2
        start=fold*(i-1)+1;
        finish=fold*i;
       testX= shuffledX(start:finish,1:d);
       
       label_real_test= shuffledX(start:finish,d+1);
     
       
        if (i==1)
            trainX=shuffledX(finish+1:newSize,:);
           
       elseif(i==2)
           trainX=shuffledX(1:(finish-1),:);
           fld=fl(:,1:d)
         testX=[testX;fld];
         label_fl=fl(:,d+1);
         label_real_test=[label_real_test ; label_fl];
          
   
    else
           
       Xtrain1=shuffledX(1:start-1,:);
       Xtrain2=shuffledX(finish+1:newSize,:);
       trainX=[Xtrain1 ; Xtrain2];
        end
       label_train=trainX(:,d+1);
       trainX=trainX(:,1:d);
       
       
      [timeT,acc]=ktree(trainX,testX,label_train,label_real_test,P1,P2,kfeature);
      accFold(i)=acc;
     timefold(i)=timeT;
 
end %end of fold
%     a=tac;
%     timeT(f,t)=a;
timeT(f,t)=mean(timefold);
  accT(t)=mean(accFold);


end
% timetotal(f,:)=
 accTotal(f)=mean(accT)
 
end 

