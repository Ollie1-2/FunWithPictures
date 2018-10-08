% inverse mapping function
f = @(x, unused) fliplr(x);

% maketform arguments
ndims_in = 2;
ndims_out = 2;
forward_mapping = [];
inverse_mapping = f;
tdata = [];
tform = maketform('custom', ndims_in, ndims_out, ...
    forward_mapping, inverse_mapping, tdata);

body = imread('monalisa.jpg');
body2 = imtransform(body, tform);

subplot(1,2,1)
imshow(body)
subplot(1,2,2)
imshow(body2)