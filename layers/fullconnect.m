function output = fullconnect(in, filterBank, biasVect)

% convert image and filter to doubles
in = double(in);
filterBank = double(filterBank);

% find d1
inSize = size(in);
d1 = inSize(3);

% find d2
filterBankSize = size(filterBank);
d2 = filterBankSize(4);

% apply filter of same size to each dimension of image
for i = 1:d2
        sum = 0;
    for j = 1:inSize(1)
        for k = 1:inSize(2)
            for l = 1:d1
                piece = in(j, k, l);
                filterl = filterBank(j, k, l, i);
                sum = sum + imfilter(piece,filterl,'conv','same');
            end
        end
    end
    output(1,1,i) = sum + biasVect(i);
end
end