L = double(rgb2gray(imread('pair2-L.png')));
R = double(rgb2gray(imread('pair2-R.png')));
[D]=disparity_ncorr(L,R); 
imshow(D,[0 100]);