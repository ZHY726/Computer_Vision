F1 = imread('ps0-1-a-1.png');
B = F1(:,:,3);
R = F1(:,:,1);
F1(:,:,1) = 0;
F1(:,:,3) = 0;
Fn = imnoise(F1,'gaussian',0,0.01)
Fn(:,:,1) = R;
Fn(:,:,3) = B;
F2 = imgaussfilt(Fn);
subplot(1,2,1),imshow(Fn);
subplot(1,2,2),imshow(F2);