I = imread('ps2-input0.png');
BW = edge(I,'Canny');
[H,T,R] = hough_lines_acc(BW);
P  = hough_peaks(H,10);
hough_lines_draw(I,P,R,T)



