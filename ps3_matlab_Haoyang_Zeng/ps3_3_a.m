L0 = imread('pair1-L.png')
Ln = imnoise(L0, 'gaussian', 0, 0.01)
L = double(rgb2gray(Ln));
R = double(rgb2gray(imread('pair1-R.png')));
[D]=disparity_ssd(L,R); 
imshow(D,[0,100])

