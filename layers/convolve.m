function output = convolve(in, f, outputSize)   
    
    output = zeros(32,32,10);
    for i = 1:10
        temp = zeros(32,32);
        for j = 1:3
            temp = temp + imfilter(in(:,:,j),f(:,:,j,i),'conv','same')
        end
        output(:,:,i) = temp;
    end

    
end