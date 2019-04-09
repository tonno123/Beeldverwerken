function borderImage = border(image, angle)
    angle = abs(angle);
    if angle > pi/2 && angle < pi
        angle = angle - pi/2;
    elseif angle > pi && angle < 3*pi/2
        angle = angle - pi;
    elseif angle > 3*pi/2 && angle < 2*pi
        angle = angle - 3*pi/2;
    end
    [x,y] = size(image);

    x1 = floor(y * sin(angle) + x * cos(angle) + 0.5);
    y1 = floor(y * cos(angle) + x * sin(angle) + 0.5);
    
    x_start = floor((x1-x)/2);
    y_start = floor((y1-y)/2);
    
    if x_start == 0
        x_start = 1;
    end
    if y_start == 0
        y_start = 1;
    end
    
    borderImage = zeros(x1, y1);
    borderImage(x_start:x_start+x-1, y_start:y_start+y-1) = image;
end