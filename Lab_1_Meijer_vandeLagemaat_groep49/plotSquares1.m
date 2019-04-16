function output = plotSquares1(image, xy, XYZ)
    projMatrix = estimateProjectionMatrix(xy, XYZ);
    cube1 = createCube(1, [-0.5, -0.5, 0.5]);
    cube2 = createCube(1, [4.5, -0.5, 3.5]);
    cube3 = createCube(1, [-0.5, 6.5, 6.5]);
    cubes = {cube1; cube2; cube3};
    imshow(image);
    hold on;
    for ii = 1:size(cubes)
        outputMatrix = zeros(6,5,2);
        cube = cubes{ii};
        for i = 1:6
            temp = [cube(i, :, 1);cube(i, :, 2);cube(i, :, 3); ones(1, size(cube(i, :, 2), 2))];
            temp = projMatrix * temp;
            temp = [rdivide(temp(1,:), temp(3,:)) ; rdivide(temp(2,:), temp(3,:))];
            outputMatrix(i,:,1) = temp(1,:);
            outputMatrix(i,:,2) = temp(2,:);
        end
        subPlotFaces(outputMatrix);
    end
    hold off;
end