function [ED] = Edistance(Q, D)
ED = sqrt(sum((Q-D).^2));
end