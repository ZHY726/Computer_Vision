F = imread('ps2-input0.png');
out = edge(F,'Canny');
imshow(out);