function sim = gaussianKernel(x1, x2,sigma)

%sigma=cov(x1,x2);
% sigma=1;
sim = 0;

sim = exp(-1*(x1-x2)'*(x1-x2)./(2*sigma*sigma));

% =============================================================

end