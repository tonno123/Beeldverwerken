function rotatedImage = rotateImage (image, angle)
im_size = size(image);
x = im_size(1);
y = im_size(2);
A = [];
for i = 1:x
    B(1:y) = i;
    A = [A B];
end
C = repmat(reshape((1:y), [1, y]), 1, x);
rotatedImage = [A; C];
D = ones(1, (x*y));
rotatedImage = [rotatedImage; D];

iv_rotation = [cos(angle), sin(angle), 0; -sin(angle), cos(angle), 0; 0, 0, 1];
rotatedImage = iv_rotation * rotatedImage;
% Create the necessary rotation matrix
% Obtain indices needed for interpolation
% Obtain colors for the whole rotatedImage matrix
% using the specified interpolation method

   