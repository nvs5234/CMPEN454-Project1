function output = fullconnect(in, filterBank, biasVect)

% find d1
inSize = size(in);
d1 = inSize(3);

% find d2
filterBankSize = size(filterBank);
d2 = filterBankSize(4);

% convert image and filter to doubles
im = double(in);
filt = double(filterBank);

%initialze sum
sum = 0;

% apply filter of same size to each dimension of image
for i = 1:d2
    for j = 1:inSize(1)
        for k = 1:inSize(2)
            for l = 1:d1
                piece = im(j, k, l);
                filterl = filt(j, k, l, i);
                sum = sum + piece * filterl;
            end
        end
    end
end
output(1,1,i) = sum + biasVect(i);
end