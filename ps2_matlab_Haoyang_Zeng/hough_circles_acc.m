function [H] = hough_circles_acc(BW,r)
H = zeros(size(BW));
[x y] = find(BW); %find all pixels which val = 1
%to get the value of H matrix
for i = 1:length(y)
    low = y(i)-r;
    high = y(i)+r;
    if (low < 1)
        low = 1; 
    end
    if (high > size(BW,2)) 
        high = size(BW,2); 
    end
    for y0 = low:high
        x1 = round(x(i)-sqrt(r^2-(y(i)-y0)^2));
        x2 = round(x(i)+sqrt(r^2-(y(i)-y0)^2));
        %if the circles dont beyond the boundry of image, acc+1
        if x1 < size(BW,1) & x1 > 1
            H(x1,y0) = H(x1,y0) + 1;
        end 
        if x2 < size(BW,1) & x2 > 1
            H(x2,y0) = H(x2,y0) + 1;
        end 
    end 
end
end
