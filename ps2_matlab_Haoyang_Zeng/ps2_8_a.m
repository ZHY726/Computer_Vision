I = imread('ps2-input3.png');
gray = rgb2gray(I);
figure, imshow(gray), hold on
smooth = imgaussfilt(gray,10);
BW = edge(smooth, 'canny');
[H,T,R] = hough_lines_acc(BW);
P = hough_peaks(H,50);
i = 1;
[X, Y] = size(P);
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
j = 1;
while j <= X
    xr = P(j,1);
    xt = P(j,2);
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
    if abs(xt - 1) > 10 & abs (xt - 360) > 10 
        plot(x,y,'LineWidth',2,'Color','green')
    end
    j = j + 1;
end

