F1 = imread('ps0-1-a-1.png');
R = F1(:,:,1);
F2 = F1;
F2(:,:,1) = R;
F2(:,:,2) = 0;
F2(:,:,3) = 0;
subplot(1,2,1), imshow(F1), title('originial');
subplot(1,2,2), imshow(F2), title('Red');