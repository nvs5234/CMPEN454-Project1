function output = softmax(in)
% turn set of numbers into probabilities by exponentiation

% get alpha and integer of third dimension
output = in;    % output will be same as input but exponentiated and normalized
alpha = max(in(1,1,:)); % find alpha across all inputs
inSize = size(in);
dimension = inSize(3);

for i = 1:dimension
    numer = exp(in(1,1,i)-alpha);
    denom = sum(exp(in(1,1,:)-alpha));
    output(1,1,i) = numer/denom;
end     
  
end