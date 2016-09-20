function output = demo1(input)
    % Loading this file defines imageset, trueclass, and classlabels
    load CNNparameters.mat
    addpath layers
    addpath evaluations

    % Clear command window for each run
    clc
    
    % Find the number of images in the set
    imageSetSize = size(imageset);
    
    result = zeros(1,1,10,imageSetSize(4));
    
    % Iterate across all found images
    for imageIndex = 1:imageSetSize(4)
        c = sprintf('image %d',imageIndex);
        disp(c);
        
        im = double(imageset(:,:,:,imageIndex));
        
        im = normalize(im);
        % debugging(im,1);
        
        im = convolve(im,filterbanks{2}, biasvectors{2});
        % debugging(im,2);
        
        im = relu(im);
        % debugging(im,3);
        
        im = convolve(im,filterbanks{4}, biasvectors{4});
        % debugging(im,4);
        
        im = relu(im);
        % debugging(im,5);
        
        im = maxpool(im);
        % debugging(im,6);
        
        im = convolve(im,filterbanks{7}, biasvectors{7});
        % debugging(im,7);
        
        im = relu(im);
        % debugging(im,8);
        
        im = convolve(im,filterbanks{9}, biasvectors{9});
        % debugging(im,9);
        
        im = relu(im);
        % debugging(im,10);
        
        im = maxpool(im);
        % debugging(im,11);
        
        im = convolve(im,filterbanks{12}, biasvectors{12});
        % debugging(im,12);
        
        im = relu(im);
        % debugging(im,13);
        
        im = convolve(im,filterbanks{14}, biasvectors{14});
        % debugging(im,14);
        
        im = relu(im);
        % debugging(im,15);
        
        im = maxpool(im);
        % debugging(im,16);
        
        im = fullconnect(im,filterbanks{17}, biasvectors{17});
        % debugging(im,17);
        
        im = softmax(im);
        % debugging(im,18);
        
        % Generate result
        result(:,:,1:10,imageIndex) = im(:,:);    
    end
    
    A = confusionMx(result,imageSetSize(4));
    plot = kPlot(result,imageSetSize(4));
    
    clearvars -except result A plot
    save('result.mat');
    display('Testing complete');
end