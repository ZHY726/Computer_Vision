F1 = imread('0.png');
F2 = imread('1.png');
F3 = imread('2.png');
F1 = im2gray(F1);
F2 = im2gray(F2);
F3 = im2gray(F3);
[g10,g11,g12,g13] = gaussian(F1);
[g20,g21,g22,g23] = gaussian(F2);
[g30,g31,g32,g33] = gaussian(F3);
g101 = warp(g10,0.01,0);
g201 = warp(g20,1.01,0);
g301 = warp(g30,2.01,0);
[X1, Y1, M11, M12] = LK(g10,g101);
[X2, Y2, M21, M22] = LK(g20,g201);
[X3, Y3, M31, M32] = LK(g30,g301);
subplot(1,3,1);
imshow(F1);
hold on;
quiver(X1, Y1, M11, M12, 'g')
title('0');
subplot(1,3,2);
imshow(F2);
hold on;
title('1');
quiver(X2, Y2, M21, M22, 'g')
subplot(1,3,3);
imshow(F3);
hold on
quiver(X3, Y3, M31, M32, 'g')
title('2');
