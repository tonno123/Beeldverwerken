function rotatedImage = rotateImage(image, angle, method)
    image = border(image, angle);
    R = [cos(-angle), -sin(-angle); sin(-angle), cos(-angle)];
    [x_size, y_size] = size(image);
    center = transpose(repmat([(x_size / 2);(y_size / 2)], x_size*y_size/2, 2));
    rotatedImage = zeros(x_size, y_size);
    
    [X, Y] = meshgrid(1:x_size, 1:y_size);
    coordinates = transpose([X(:), Y(:)]);
    
    canvas = R * (coordinates - center) + center;
    tic
    for i = 1:length(canvas)
       x = canvas(1, i);
       y = canvas(2, i);
       x1 = coordinates(1, i);
       y1 = coordinates(2, i);
       color = pixelValue(image, x, y, method);
       rotatedImage(x1, y1) = color;
    end
    toc
        
end