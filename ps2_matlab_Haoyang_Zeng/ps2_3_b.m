I = imread('ps2-input0-noise.png');
smooth = imgaussfilt(I,2)
BW1 = edge(I, 'canny')
BW2 = edge(smooth, 'canny')
subplot(2,1,1)
imshow(BW1)
subplot(2,1,2)
imshow(BW2);