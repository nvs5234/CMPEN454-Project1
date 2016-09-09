function project1()
    %loading this file defines imageset, trueclass, and classlabels
    load cifar10testdata.mat
    load CNNparameters.mat
    addpath layers

    %find the number of images in the set
    imageSetSize = size(imageset);

    %iterate across all found images
    %for imageIndex = 1:imageSetSize(4)
    for imageIndex = 1:1 
        im = double(imageset(:,:,:,imageIndex));

        im = normalize(im);
        size(im)

        im = convolve(im,filterbanks{2},'full');
        size(im)
        im = relu(im);
    end

    %some sample code to read and display one image from each class
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