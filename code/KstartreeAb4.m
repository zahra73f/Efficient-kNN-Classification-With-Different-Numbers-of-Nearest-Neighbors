dl = load('abalone.txt');
dataSet=dl(:,2:end);
dataSet_labels=dl(:,1);

% dl=load('balance_label.txt');
 P1=0.0001;
 P2=0.00001;
kfeature=4;


wholeDataSet=[dataSet dataSet_labels];
[n d]=size(dataSet);
omit=mod(n,10);
fl=wholeDataSet((n-omit)+1:n, :);
newSize= n-omit;
fold=newSize/10;
newTrainX=wholeDataSet(1:newSize,:);



for t=1:10
    shuffledX = newTrainX(randperm(size(newTrainX,1)),:);
    tic;
for i=1:10
        start=fold*(i-1)+1;
        finish=fold*i;
       testX= shuffledX(start:finish,1:d);
       
       label_real_test= shuffledX(start:finish,d+1);
     
       
        if (i==1)
            trainX=shuffledX(finish+1:newSize,:);
           
       elseif(i==10)
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
       
       
      acc=Kstartree(trainX,testX,label_train,label_real_test,P1,P2,kfeature);
      accFold(i)=acc;
     
 
end %end of fold
    a=tac;
    timeT(t)=a

  accT(t)=mean(accFold);


end
 accTotal=mean(accT)
 
 

