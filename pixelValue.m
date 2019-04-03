function color = pixelValue ( image , x , y , method )
% pixel value at real coordinates
if inImage ( size ( image ) ,x , y )
% do the interpolation
    switch ( method )
        case 'nearest'
            color = image(floor(x + 0.5), floor(y + 0.5));
        return;
        case 'linear'
            alfa = x - floor(x);
            beta = y - floor(y);
            color = (1-alfa)*(1-beta)*image(floor(x), floor(y))+(1-alfa)*beta*image(floor(x), floor(y+1.0))+alfa*beta*image(floor(x+1.0), floor(y+1.0))+alfa*(1-beta)*image(floor(x+1.0), floor(y));
    end % end switch
else
    % return a constant
end