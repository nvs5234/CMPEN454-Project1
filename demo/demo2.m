function output = demo1()
    % Loading this file defines imageset, trueclass, and classlabels
    load    ..\CNNparameters.mat
    load    ..\cifar10testdata.mat
    addpath ..\layers
    addpath ..\evaluations

    % Clear command window for each run
    clc
    
    % airplane image
    im = double(imread('airplane.jpg'));

    %start the process
    
    %step 1
    im = normalize(im);

    %step 2
    im = convolve(im,filterbanks{2}, biasvectors{2});

    %step 3
    im = relu(im);
    displayGraphs(im, 3);

    %step 4
    im = convolve(im,filterbanks{4}, biasvectors{4});

    %step 5
    im = relu(im);

    %step 6
    im = maxpool(im);

    %step 7
    im = convolve(im,filterbanks{7}, biasvectors{7});
    
    %step 8
    im = relu(im);
    displayGraphs(im, 8);

    %step 9
    im = convolve(im,filterbanks{9}, biasvectors{9});

    %step 10
    im = relu(im);
    
    %step 11
    im = maxpool(im);

    %step 12
    im = convolve(im,filterbanks{12}, biasvectors{12});

    %step 13
    im = relu(im);
    displayGraphs(im, 13);

    %step 14
    im = convolve(im,filterbanks{14}, biasvectors{14});

    %step 15
    im = relu(im);

    %step 16
    im = maxpool(im);
    
    %step 17
    im = fullconnect(im,filterbanks{17}, biasvectors{17});

    %step 18
    im = softmax(im);

    % Print result
    for i = 1:10
        l = sprintf('%10s - %7.3f%%',classlabels{i}, im(i)*100);
        disp(l);
    end
end