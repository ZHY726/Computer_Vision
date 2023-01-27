I = imread('ps2-input2.png');
gray = rgb2gray(I);
smooth = imgaussfilt(gray,10)
BW = edge(smooth, 'canny')
[H,T,R] = hough_lines_acc(BW);
P = hough_peaks(H,20);
[X, Y] = size(P);
figure, imshow(smooth), hold on
i = 1;
while i <= X
    %read the top X peeks value
    xr = P(i,1);
    xt = P(i,2);
    %find the corresponding rho and theta values
    r = R(1,xr);
    t = T(1,xt);
    %special condition when theta equals 0
    if t == 0
        y = [-1000,1000]
        x = [r,r]
    %common conditions
    else
        x = [-1000,1000]
        y = (r/sind(t))-x.*cosd(t)./sind(t);
    end
    if xt > 1 & abs(xt - 180) > 5
        plot(x,y,'LineWidth',2,'Color','green')
    end
    i = i + 1;
end