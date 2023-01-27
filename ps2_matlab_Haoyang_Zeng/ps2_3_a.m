I = imread('ps2-input0-noise.png');
smooth = imgaussfilt(I,1)
subplot(2,1,1)
imshow(I)
subplot(2,1,2)
imshow(smooth);