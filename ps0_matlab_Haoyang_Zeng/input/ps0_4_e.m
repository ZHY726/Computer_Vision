F1 = imread('ps0-1-a-1.png');
F1(:,:,1) = 0;
F1(:,:,3) = 0;
F2 = imtranslate(F1,[-2, 0]);
imshow(F2);