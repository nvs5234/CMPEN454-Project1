function A = confusionMx(results,length)
    load cifar10testdata.mat
    
    % Define final confusion matrix
    A = zeros(10,10);

    for imageIndex = 1:length
        im = results(:,:,1:10,imageIndex);
        A(im == max(im),trueclass(imageIndex)) = 1 + A(im == max(im),trueclass(imageIndex));
    end
end