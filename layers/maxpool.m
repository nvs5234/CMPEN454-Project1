function output = maxpool(input)
    % Goal: replicate this line
    % output(i,j,k) = max({input(r,c,k)|(2i - 1)<r<2i & (2j - 1)<c<2j});
    
    % Find dimensions
    dimSize = size(input);
    channels = dimSize(3);
    
    % Create new dimensions
    output = zeros(dimSize(1)/2,dimSize(1)/2,dimSize(3));
    
    for i = 1:channels
        currChannel = input(:,:,i);
        
        % Create 4 arrays, split by 2x2 sections in orignal image
        topLeft = currChannel(1:2:end,1:2:end);
        topRight = currChannel(1:2:end,2:2:end);
        botLeft = currChannel(2:2:end,1:2:end);
        botRight = currChannel(2:2:end,2:2:end);
        
        topMax = max(topLeft,topRight);
        botMax = max(botLeft,botRight);
        
        output(:,:,i) = max(topMax,botMax);
    end
end