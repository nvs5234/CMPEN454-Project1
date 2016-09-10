function output = convolve(in, filterBank, biasVect)   
    
%     output = zeros(32,32,10);
%     for i = 1:10
%         temp = zeros(32,32);
%         for j = 1:3
%             temp = temp + imfilter(in(:,:,j),f(:,:,j,i),'conv','same')
%         end
%         output(:,:,i) = temp;
%     end

    % initialize output
    output = zeros(32,32,10);

    % find d1
    inSize = size(in);
    d1 = inSize(3);
    
    % find d2
    filterBankSize = size(filterBank);
    d2 = filterBankSize(4);
    
    for l = 1:d2
        filterl = filterBank(:,:,:,l);
        
        sum = imfilter(in(:,:,1),filterl(:,:,1),'conv','same');
        for k = 2:d1
            sum = sum + imfilter(in(:,:,k),filterl(:,:,k),'conv','same');
        end
        
        output(:,:,l) = sum + biasVect(l);
    end

    
end