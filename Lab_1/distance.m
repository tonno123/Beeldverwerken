function distance(image, angle, method)
    i = rotateImage(image, angle, method);
    j = rotateImage(i, -angle, method);
    
    d = i - j;
    
    
end