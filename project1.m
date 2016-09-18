function project1()
    % Loading this file defines imageset, trueclass, and classlabels
    load cifar10testdata.mat
    load CNNparameters.mat
    load debuggingTest.mat          % imrgb needed for testing
    addpath layers

    % Clear command window for each run
    clc
    
    % Find the number of images in the set
    imageSetSize = size(imageset);
    
    % Iterate across all found images
    for imageIndex = 1:imageSetSize(4)
    %for imageIndex = 1:1 
        im = double(imageset(:,:,:,imageIndex));
        %im = double(imrgb);
        
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
        
    end

    % Some sample code to read and display one image from each class
    % for classindex = 1:10
    %     %get indices of all images of that class
    %     inds = find(trueclass==classindex);
    %     %take first one
    %     imrgb = imageset(:,:,:,inds(1));
    %     %display it along with ground truth text label
    %     figure; imagesc(imrgb); truesize(gcf,[64 64]);
    %     title(sprintf('%s',classlabels{classindex}));
    % end
end