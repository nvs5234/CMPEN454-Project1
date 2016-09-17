function output = fullconnect(in, filterBank, biasVect)

% find d1
inSize = size(in);
d1 = inSize(3);

% find d2
filterBankSize = size(filterBank);
d2 = filterBankSize(4);

% apply filter of same size to each dimension of image
for i = 1:d2
    filteri = filterBank(:,:,:,i);
    for j = 1:inSize(1)
        for k = 1:inSize(2)
            for l = 1:d1
                piece = img(j, k, l);
                filterl = filter(j, k, l, filteri);
                sum = sum + piece * filterl;
            end
        end
    end
end
                
end