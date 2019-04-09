function tmp = inImage(image_size, x, y)
    if (y >= 1) && (image_size(1) > x) && (x >= 1) && (image_size(2) > y)
            tmp = 1;
    else
        tmp = 0;
    end
end