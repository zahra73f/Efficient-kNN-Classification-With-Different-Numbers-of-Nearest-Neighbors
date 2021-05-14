function [ index]=one_nn(trainX,testpoint)
% label_test = zeros(size(testX,1),1);
%             for i = 1:size(testX,1)
                this = testpoint;
                %this=x;
                dists = sum((trainX - repmat(this,size(trainX,1),1)).^2,2);
                [d I] = sort(dists,'ascend');
                index=I(1);
                
                
              
%             end
end