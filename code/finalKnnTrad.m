
dl = load('movement_libras.data.txt');

dataSet_labels = dl(:,end);
dataSet1=dl(:,1:end-1);


randInd=randperm(90,60);
dataSet=dataSet1(:,randInd);

wholeDataSet=[dataSet dataSet_labels];
[n d]=size(dataSet);
omit=mod(n,10);
fl=wholeDataSet((n-omit)+1:n, :);
newSize= n-omit;
fold=newSize/10;
newTrainX=wholeDataSet(1:newSize,:);

K=[1 5 10 20];
for j=1:4
    k=K(1,j);
for t=1:10
    shuffledX = newTrainX(randperm(size(newTrainX,1)),:);
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
       
       tic;
      acc=knnTrad(trainX,k,testX,label_train,label_real_test);
      a=toc;
timefold(i)=a;
accFold(i)=acc;
     
 
end %end of fold
   timeT(t)=mean(timefold) ;
  accT(t)=mean(accFold);


end
 accTotal(j)=mean(accT)
 
 
 end
[maxAcc indexK]=max(accTotal);
indexK;
maxAcc