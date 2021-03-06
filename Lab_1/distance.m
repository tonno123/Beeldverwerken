function distance = distance(image, angle, method)
    [x, y] = size(image);
    i = rotateImage(image, angle, method);
    j = rotateImage(i, -angle, method);
    
    [x1, y1] = size(j);
    
    x_start = floor((x1 - x) / 2);
    y_start = floor((y1 - y) / 2);
    j = j(x_start:x_start + x - 1, y_start:y_start + y - 1);
    
    d = image - j;
    d = d.*d;
    imshow(d);
    distance = sum(d(:)) / length(d);
end