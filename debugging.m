% debugging check for CNN layers
function debugging(filteredImage, stepIndex)
    load debuggingTest.mat

    if filteredImage == layerResults{stepIndex}
        fprintf('Step %i passes\n',stepIndex)
    else
        fprintf('Step %i fails\n',stepIndex)
    end
    
end