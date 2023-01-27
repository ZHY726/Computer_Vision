%F1 = imread('simB.jpg');
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
%set threshold
for i = 1 : size (hv1, 1)
    for j = 1 : size (hv1, 2)
        if hv1(i,j) < 125
            hv1 (i,j) = 0;
        end
    end
end
max = colfilt(hv1, [5 5], 'sliding', @max);
jud = im2uint8(hv1 == max & max > 0);
jud = jud./255;
%get the max points
Max = hv1.* jud;
imshow(F1)
hold on;
[m,n] = size(F1);
num = 0;
%plot the corners
for i = 1 : m
    for j = 1 : n
        if(Max(i,j) > 0)
            plot(j,i,'o');
            num = num + 1;
        end
    end
end