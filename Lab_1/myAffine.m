function r = myAffine(image, x1, y1, x2, y2, x3, y3, M, N, method)
    r = zeros(N,M);
    
    A = [x1, x2, x3; y1, y2, y3];
    B = [N, 1, 1; 1, 1, M; 1, 1, 1];
    
    X = A / B;
    
    xValues = [1:(size(image, 1))];
    xValues = repmat(xValues, (size(image, 2)), 1);
    xValues = reshape(xValues, 1, (size(image, 1))*(size(image, 2)));
    
    yValues = [1:(size(image, 2))];
    yValues = repmat(yValues, 1, (size(image, 1)));
    
    imageVec= [xValues; yValues; ones(1, M*N)];
    affine = X * imageVec;
    
    for i = 1:M*N
        xa = imageVec(2, i);
        ya = imageVec(1, i);
        
        c = affine(:, i);
        x = c(1);
        y = c(2);        
        r(ya, xa) = pixelValue(image, x, y, method);
    end
end

