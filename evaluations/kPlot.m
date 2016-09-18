function plot = kPlot(results,length)
    load cifar10testdata.mat
    
    plot = zeros(10,1);
    ipMap = zeros(10,2);
    
    for imageIndex = 1:length
        im = results(:,:,1:10,imageIndex);
        
        for i = 1:10
            ipMap(i,1) = double(i);
            ipMap(i,2) = im(1,1,i);
        end

        ipMap = sortrows(ipMap,-2);
        
        for k = 1:10
            temp = round(ipMap(k,1));
            if trueclass(imageIndex) == temp
                for j = k:10
                    plot(j) = plot(j) + 1;
                end
                break
            end
        end
    end
     
    plot = double(plot)/length;
    
end