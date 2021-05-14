function [ label_test]=knnStar(trainX,k,testX,labeltrain)
label_test = zeros(size(testX,1),1);
            for i = 1:size(testX,1)
                this = testX(i,:);
                %this=x;
                dists = sum((trainX - repmat(this,size(trainX,1),1)).^2,2);
                [d I] = sort(dists,'ascend');
%                 k=cell2mat(K(i));
%                 k=str2num(k);
                indexV=I(1:k,1);
                label_in=labeltrain(indexV);
                label_test(i)=mode(label_in);
                
                
              
            end
end