F1 = imread('simA.jpg');
F2 = imread('simB.jpg');
[m,n] = size(F1);
%smooth
img1 = imgaussfilt(F1,2);
img2 = imgaussfilt(F2,2);
[X1,Y1] = imgradientxy(img1);
[X2,Y2] = imgradientxy(img2);

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
Max1 = hv1.* jud;
f1 = single(F1);
Fin1 = zeros(4,1000);
index = 1;
for i = 1 : m
    for j = 1 : n
        if(Max1(i,j) > 0)
            Fin1(1,index) = j;
            Fin1(2,index) = i;
            Fin1(3,index) = 1;
            angle = atan2(X1(i,j),Y1(i,j));
            Fin1(4,index) = angle;
            index = index + 1;
        end
    end
end
[fa,da] = vl_sift(f1,'frames',Fin1);
subplot(1,2,1);
imshow(F1);
hold on;
h1 = vl_plotframe(fa);

[GradientX1,GradientY1] = imgradientxy(F2);
x1 = im2uint8(GradientX1);
y1 = im2uint8(GradientY1);
%smooth the graph by Gaussian
m11 = imfilter(x1 .* x1, GF);
m12 = imfilter(x1 .* y1, GF);
m21 = imfilter(x1 .* y1, GF);
m22 = imfilter(y1 .* y1, GF);
hv1 = (m11 .* m22 - m12 .* m21) - 0.5 * (m11 + m22).^2;
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
Max2 = hv1.* jud;
f2 = single(F2);
Fin = zeros(4,1000);
index = 1;
for i = 1 : m
    for j = 1 : n
        if(Max2(i,j) > 0)
            Fin(1,index) = j;
            Fin(2,index) = i;
            Fin(3,index) = 1;
            angle = atan2(X1(i,j),Y1(i,j));
            Fin(4,index) = angle;
            index = index + 1;
        end
    end
end
[fb,db] = vl_sift(f2,'frames',Fin);
subplot(1,2,2);
imshow(F2);
hold on;
h2 = vl_plotframe(fb);

set(h1,'color','g','linewidth',2);
set(h2,'color','y','linewidth',2);