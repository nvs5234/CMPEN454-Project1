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
    %for imageIndex = 1:imageSetSize(4)
    for imageIndex = 1:1 
        %im = double(imageset(:,:,:,imageIndex));
        im = double(imrgb);
        
        im = normalize(im);
        debugging(im,1);
        
        im = convolve(im,filterbanks{2}, biasvectors{2});
        debugging(im,2);
        
        im = relu(im);
        debugging(im,3);
        
        im = convolve(im,filterbanks{4}, biasvectors{4});
        debugging(im,4);
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