F1 = imread('im1.jpg');
[m,n,a] = size(F1);
R = F1(:,:,1);
G = F1(:,:,2);
B = F1(:,:,3);
F1 = im2double(F1);
F1 = imresize(F1, [100,100]);
X = reshape(F1,100 * 100,3);
%F2 = F1;
%F2(:,:,2) = B;
%F2(:,:,3) = G;
subplot(1,2,1), imshow(F1), title('originial');
%subplot(1,2,2), imshow(F2), title('swap G-B');