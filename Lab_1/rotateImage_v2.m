function rotatedImage = rotateImage_v2 (image, angle)
im_size = size(image);
x = im_size(1);
y = im_size(2);
A = [];
for i = 1:x
    B(1:y) = i;
    A = [A B];
end
C = repmat(reshape((1:y), [1, y]), 1, x);
resultCoordinates = [A; C];
D = ones(1, (x*y));
resultCoordinates = [resultCoordinates; D];

iv_rotation = [cos(angle), sin(angle), 0; -sin(angle), cos(angle), 0; 0, 0, 1];
originalCoordinates = iv_rotation * resultCoordinates;
for i = 1:length(resultCoordinates)
       x = originalCoordinates(1, i);
       y = originalCoordinates(2, i);
       x1 = resultCoordinates(1, i);
       y1 = resultCoordinates(2, i);
       color = pixelValue(image, x, y, method);
       rotatedImage(x1, y1) = color;
    end
% Create the necessary rotation matrix
% Obtain indices needed for interpolation
% Obtain colors for the whole rotatedImage matrix
% using the specified interpolation method

   