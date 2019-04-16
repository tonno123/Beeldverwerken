function M = estimateProjectionMatrix(xy, XYZ)
A = create3DProjectionMatrix(XYZ, xy);
% Do Singular Value Decomposition to obtain m
[U , D , V ] = svd ( A );
m = V (: , end );
% reshape m into the 3 x4 projection matrix M
M = reshape (m , 4 , 3)';
end
% xy = getfield(calibrationpoints, 'xy');
% XYZ = getfield(calibrationpoints, 'XYZ');
% estimateProjectionMatrix(xy, XYZ)