F1 = imread('ps0-1-a-1.png');
F1(:,:,1) = 0;
F1(:,:,3) = 0;
%subplot(2,1,1), imshow(F1), title('img1_green');
%subplot(2,1,2), 
imhist(F1,256), axis tight, title('histogram');