L = double(rgb2gray(imread('pair1-L.png')));
R = double(rgb2gray(imread('pair1-R.png')));
[D]=disparity_ncorr(R,L); 
imshow(D,[0 100]);
