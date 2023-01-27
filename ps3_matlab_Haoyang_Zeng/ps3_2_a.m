L = double(rgb2gray(imread('pair1-L.png')));
R = double(rgb2gray(imread('pair1-R.png')));
[D]=disparity_ssd(L,R); 
imshow(D,[0 100]);


