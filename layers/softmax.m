function output = softmax(in)
% turn set of numbers into probabilities by exponentiation

% get alpha and integer of third dimension
output = in;    % output will be same as input but exponentiated and normalized
alpha = max(in(1,1,:)); % find alpha across all inputs
inSize = size(in);
dimension = inSize(3);
sumofd = 0;

for i = 1:dimension
    % compute the sum of the denominator first
    denominator = exp((in(1,1,i) - alpha));
    sumofd = sumofd + denominator;
end

for k = 1:dimension
        % compute output by normalizing the probabilities
        numerator = exp((in(1,1,k) - alpha));
        output(1:1:k) = numerator / sumofd;
end        
  
end