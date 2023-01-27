F1 = imread('transA.jpg');
F2 = imread('transB.jpg');
F3 = imread('simA.jpg');
F4 = imread('simB.jpg');
GF = fspecial('gaussian',16,2);
%get the gradient graph
[GradientX1,GradientY1] = imgradientxy(F1);
x1 = im2uint8(GradientX1);
y1 = im2uint8(GradientY1);
%smooth the graph by Gaussian
m11 = imfilter(x1 .* x1, GF);
m12 = imfilter(x1 .* y1, GF);
m21 = imfilter(x1 .* y1, GF);
m22 = imfilter(y1 .* y1, GF);
hv1 = (m11 .* m22 - m12 .* m21) - 0.5 * (m11 + m22).^2;
subplot(2,2,1);
imshow(hv1);
title('transA image')
%the same as the 'transA'
[GradientX1,GradientY1] = imgradientxy(F2);
x1 = im2uint8(GradientX1);
y1 = im2uint8(GradientY1);
m11 = imfilter(x1 .* x1, GF);
m12 = imfilter(x1 .* y1, GF);
m21 = imfilter(x1 .* y1, GF);
m22 = imfilter(y1 .* y1, GF);
hv2 = (m11 .* m22 - m12 .* m21) - 0.5 * (m11 + m22).^2;
subplot(2,2,2);
imshow(hv2);
title('transB image')
[GradientX1,GradientY1] = imgradientxy(F3);
x1 = im2uint8(GradientX1);
y1 = im2uint8(GradientY1);
m11 = imfilter(x1 .* x1, GF);
m12 = imfilter(x1 .* y1, GF);
m21 = imfilter(x1 .* y1, GF);
m22 = imfilter(y1 .* y1, GF);
hv3 = (m11 .* m22 - m12 .* m21) - 0.5 * (m11 + m22).^2;
subplot(2,2,3);
imshow(hv3);
title('simA image')
[GradientX1,GradientY1] = imgradientxy(F4);
x1 = im2uint8(GradientX1);
y1 = im2uint8(GradientY1);
m11 = imfilter(x1 .* x1, GF);
m12 = imfilter(x1 .* y1, GF);
m21 = imfilter(x1 .* y1, GF);
m22 = imfilter(y1 .* y1, GF);
hv4 = (m11 .* m22 - m12 .* m21) - 0.5 * (m11 + m22).^2;
subplot(2,2,4);
imshow(hv4);
title('transA image')