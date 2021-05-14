function [ index]=one_nn_X(trainX,testpoint,vectorIndex)
% label_test = zeros(size(testX,1),1);
%             for i = 1:size(testX,1)
%for i=1:length(vectorIndex)
                this = testpoint;
                %this=x;
                dists = sum((trainX(vectorIndex,:) - repmat(this,length(vectorIndex),1)).^2,2);
                [d I] = sort(dists,'ascend');
                index=vectorIndex(I(1));
                
                
              
%             end
end