function Matrix = create3DProjectionMatrix(xyz, uv)
    x = xyz(: , 1);
    y = xyz(: , 2);
    z = xyz(: , 3);
    % we cannot use x ’ and y ’ in Matlab because ’ means transposed
    u = uv(: , 1);
    v = uv(: , 2);
    o = ones ( size ( x ));
    zero = zeros ( size ( x ));
    Aoddrows = [x , y , z, o , zero , zero , zero , zero, -u .* x , -u .* y , -u .* z, -u ];
    Aevenrows = [zero , zero , zero , zero, x , y , z, o , -v .* x , -v .* y , -v .* z, -v ];
    Matrix = [ Aoddrows ; Aevenrows ];
end
