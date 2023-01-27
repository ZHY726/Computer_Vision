L0 = imread('pair1-L.png')
Ln = imadjust(L0,[0.1 1],[]);
L = double(rgb2gray(Ln));
R = double(rgb2gray(imread('pair1-R.png')));
[D]=disparity_ncorr(R,L); 
imshow(D,[0,100])