function displayGraphs(im, stepNum)

    for i = 1:10
        
        image = im(:,:,i);
        
        % normalize images between 0 and 1
        minval = min(min(image));
        maxval = max(max(image));
        newim = (image - minval)/(maxval-minval);
      
        figure();
        colormap(gray);
        imagesc(newim);
        titleStr = sprintf('Step: %d - (:,:,%d)',stepNum,i);
        title(titleStr);
        
    end

end