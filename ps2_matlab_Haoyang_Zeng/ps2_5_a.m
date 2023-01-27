clear all;
I = imread('ps2-input1.png');
gray = rgb2gray(I);
smooth = imgaussfilt(gray,10)
BW = edge(smooth, 'canny')
r=30
H = hough_circles_acc(BW,r)
figure, imshow(I), hold on
n=2
center = hough_peaks(H,n)
l = size(center);
i = 1;
while(i <= n)
    u = -5:0.1:5;
    x0 = center(i,1);
    y0 = center(i,2);
    x = x0 + r*sin(u);
    y = y0 + r*cos(u);
    plot(y0,x0,'r*')
    plot(y,x,'LineWidth',2,'Color','green')
    i = i+1;
end



