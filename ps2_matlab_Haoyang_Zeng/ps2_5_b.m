clear all;
I = imread('ps2-input1.png');
figure, imshow(I), hold on
gray = rgb2gray(I);
smooth = imgaussfilt(gray,10)
BW = edge(smooth, 'canny')
[centers,radii] = find_circles(BW,20,50)
[xl,yl] = size(centers);
i = 1;
while i <= xl
    u = -4:0.1:4
    x0 = centers(i,1);
    y0 = centers(i,2);
    r = radii(i,1)
    x = centers(i,1) + r*sin(u);
    y = centers(i,2) + r*cos(u);
    plot(y0,x0,'r*')
    plot(y,x,'LineWidth',2,'Color','green')
    i = i + 1;
end