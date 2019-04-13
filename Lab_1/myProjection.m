function projection = myProjection(image, x1, y1, x2, y2, x3, y3, x4, y4, n, m, method)
    projection = zeros(m, n);
    % (x1, y1): top left, (x2, y2): top right, (x3, y3): bottom left,
    % (x4, y4): bottom right.
    xy = [x1, y1; x2, y2; x3, y3; x4, y4];
    uv = [1, 1; 1, n; m, 1; m, n];
    
    projMatrix = createProjectionMatrix(xy, uv);
    matrix = null(projMatrix);
    matrix = reshape(matrix, 3, 3)';    
    
    xValues = [1:m];
    xValues = repmat(xValues, n, 1);
    xValues = reshape(xValues, 1, m*n);
    
    yValues = [1:n];
    yValues = repmat(yValues, 1, m);

    imageVec= [xValues; yValues; ones(1, m*n)];
    projective = inv(matrix) * imageVec;
    projective = [rdivide(projective(1,:), projective(3,:)) ; rdivide(projective(2,:), projective(3,:))];
    
    for i = 1:m*n
       xa = imageVec(2, i);
        ya = imageVec(1, i);
        
        c = projective(:, i);
        x = c(1);
        y = c(2);        
        projection(ya, xa) = pixelValue(image, x, y, method);
    end
    
    %test = myProjection(b, 186, 570, 169, 822, 559, 347, 588, 596, 300, 450, 'linear')