function [p] = hough_peaks(H,numpeaks);
H1 = H;
%find the max value and it's(x,y)
max1 = max(max(H1));
[x1,y1] = find(H1 == max1);
p = zeros(numpeaks,2);
l0 = 1;
while (l0 <= numpeaks)
%find the max value and it's(x,y)
    max1 = max(max(H1));
    [x1,y1] = find(H1 == max1);
    l1 = length(x1);
    l2 = l0+l1-1;
    l4 = size(x1);
    %if numbers of value > numpeaks, then delete the excess
    if(l2 > numpeaks)
        l2 = numpeaks
        l4 = numpeaks-l0+1;
    end
    %put the value in matrix p
    p(l0:l2,1) = x1(1:l4,:);
    p(l0:l2,2) = y1(1:l4,:);
    %make the maxvalue equal to 0 so that I can get the second largest one
    for a = l0:l2
        H1(p(a,1),p(a,2)) = 0;
    end
    l0 = l0+l1;
end