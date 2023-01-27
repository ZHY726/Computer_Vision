I = imread('ps2-input1.png');
gray = rgb2gray(I);
smooth = imgaussfilt(gray,10)
BW = edge(smooth, 'canny')
imshow(BW)
