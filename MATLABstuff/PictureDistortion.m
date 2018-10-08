pic = imread('monalisa.jpg');
clf
imshow(pic)

%square root of polar radial component
r = @(x) sqrt(x(:,1).^2 + x(:,2).^2);
w = @(x) atan2(x(:,2), x(:,1));
f = @(x) [sqrt(r(x)) .* cos(w(x)), sqrt(r(x)) .* sin(w(x))];
g = @(x, unused) f(x);

tform2 = maketform('custom', 2, 2, [], g, []);
face2 = imtransform(pic, tform2, 'UData', [-1 1], 'VData', [-1 1], ...
    'XData', [-1 1], 'YData', [-1 1]);
imshow(face2)

%square of polar radial component
f = @(x) [r(x).^2 .* cos(w(x)), r(x).^2 .* sin(w(x))];
g = @(x, unused) f(x);

tform3 = maketform('custom', 2, 2, [], g, []);
face3 = imtransform(pic, tform3, 'UData', [-1 1], 'VData', [-1 1], ...
    'XData', [-1 1], 'YData', [-1 1]);
imshow(face3)

%First, convert Cartesian coordinates to complex values; square the complex values;
%produce new Cartesian coordinates from the squared complex values. 
f = @(x) complex(x(:,1), x(:,2));
g = @(z) z.^2;
h = @(w) [real(w), imag(w)];
q = @(x, unused) h(g(f(x)));

tform4 = maketform('custom', 2, 2, [], q, []);
face4 = imtransform(pic, tform4, 'UData', [-1 1], 'VData', [-1 1], ...
    'XData', [-1 1], 'YData', [-1 1]);
imshow(face4)