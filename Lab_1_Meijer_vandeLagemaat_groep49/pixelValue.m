function color = pixelValue(image, x, y, method)
    [x_size, y_size] = size(image);
    % pixel value at real coordinates
    if inImage(size(image), x, y)
    % do the interpolation
        switch(method)
            case 'nearest'
                color = image(floor(x + 0.5), floor(y + 0.5));
            case 'linear'
                alfa = x - floor(x);
                beta = y - floor(y);
                x1 = floor(x+1);
                y1 = floor(y+1);
                
                if x1 > x_size
                    x1 = floor(x) - 1;
                end
                
                if y1 > y_size
                    y1 = floor(y) - 1;
                end
                
                color = (1-alfa)*(1-beta)*image(floor(x), floor(y))+(1-alfa)*beta*image(floor(x), y1)+alfa*beta*image(x1, y1)+alfa*(1-beta)*image(x1, floor(y));
        end % end switch
    else
        color = -1;
end