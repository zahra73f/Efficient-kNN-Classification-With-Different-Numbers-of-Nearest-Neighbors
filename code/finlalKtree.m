dataSet = load('balance.txt');
dl=load('balance_label.txt');
P1=0.001;
P2=0.00001;
kfeature=2;
dataSet_labels=dl(:,1);
wholeDataSet=[dataSet dataSet_labels];
[n d]=size(dataSet);
omit=mod(n,10);
newSize= n-omit;
fold=newSize/10;
newTrainX=wholeDataSet(1:newSize,:);
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
          
   
    else
           
       Xtrain1=shuffledX(1:start-1,:);
       Xtrain2=shuffledX(finish+1:newSize,:);
       trainX=[Xtrain1 ; Xtrain2];
        end
       label_train=trainX(:,d+1);
       trainX=trainX(:,1:d);
       f = @() ktree(trainX,testX,label_train,label_real_test,P1,P2,kfeature) ; % handle to function
       run_cost(i)=timeit(f,1);
%         accFold(i)=acc;
     
 
end %end of fold
    
%     accT(t)=mean(accFold);
     run_cost_T(t)=mean(run_cost);

end

% accTotal=mean(accT);
run_costTotal=mean(run_cost_T);