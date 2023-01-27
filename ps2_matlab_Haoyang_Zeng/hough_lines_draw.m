function hough_lines_draw(img,peaks,rho,theta)
i = 1;
[X, Y] = size(peaks);
while 1
    %read the top X peeks value
    xr = peaks(i,1);
    xt = peaks(i,2);
    %find the corresponding rho and theta values
    r = rho(1,xr);
    t = theta(1,xt);
    %special condition when theta equals 0
    if t == 0
        y = [-1000,1000]
        x = [r,r]
    %common conditions
    else
        x = [-1000,1000]
        y = (r/sind(t))-x.*cosd(t)./sind(t);
    end
    plot(x,y,'LineWidth',2,'Color','green')
    i = i + 1;
    if i > X
        break
    end
end
end