F1 = imread('ps0-1-a-1.png');
F1(:,:,1) = 0;
F1(:,:,3) = 0;
G = F1(:,:,2);
FG = F1;
FG(:,:,2) = (G - avg) / dev * 10 + avg;
%subplot(1,2,1), imshow(F1), title('img1_green');
%subplot(2,1,1), imshow(FG), title('ps-0-4-c-1');
%subplot(2,1,2),
imhist(FG,256), axis tight, title('histogram');
