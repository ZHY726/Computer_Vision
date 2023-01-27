L = double(imread('pair0-L.png'));
R = double(imread('pair0-R.png'));
[D]=disparity_ssd(L,R); 
imshow(D,[0 3]);