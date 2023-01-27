F1 = imread('ps0-1-a-1.png');
G = F1(:,:,2);
R = F1(:,:,1);
F1(:,:,1) = 0;
F1(:,:,2) = 0;
Fn = imnoise(F1,'gaussian',0,0.01)
Fn(:,:,1) = R;
Fn(:,:,2) = G;
imshow(Fn);