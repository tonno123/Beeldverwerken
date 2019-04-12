function projMatrix = createProjectionMatrix(xy, uv)
    x = xy (: , 1);
    y = xy (: , 2);
    % we cannot use x ’ and y ’ in Matlab because ’ means transposed
    u = uv (: , 1);
    v = uv (: , 2);
    o = ones ( size ( x ));
    z = zeros ( size ( x ));
    A = [];
    for i = 1:4
        Aoddrows = [x(i) , y(i) , 1 , 0 , 0 , 0 , -u(i) .* x(i) , -u(i) .* y(i) , -u(i) ];
        Aevenrows = [0 , 0 , 0 , x(i) , y(i) , 1 , -v(i) .* x(i) , -v(i) .* y(i) , -v(i) ];
        A = [A ; Aoddrows ; Aevenrows ];
    end
    projMatrix = A;
end