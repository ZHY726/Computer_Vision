F1 = imread('transA.jpg');
subplot(2,1,1);
[GradientX1,GradientY1] = imgradientxy(F1);
%show them in pairs
imshowpair(GradientX1,GradientY1,'montage');
title('transA graient-pair image');
 
F2 = imread('simA.jpg');
subplot(2,1,2);
[GradientX2,GradientY2] = imgradientxy(F2);
%show them in pairs
imshowpair(GradientX2,GradientY2,'montage');
title('simA graient-pair image');

%method 2
f1 = [-1 0 1; -1 0 1; -1 0 1];
f2 = [-1 -1 -1; 0 0 0; 1 1 1];
x = imfilter(F1, f1);
y = imfilter(F2, f2);
%but the gradient image is from 0 to 256