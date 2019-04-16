function output = enterCalibrationPoints(image, n)
    imshow(image)
    hold on;
    output = ginput(n);
end