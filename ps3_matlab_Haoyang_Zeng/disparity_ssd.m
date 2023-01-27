function [out]=disparity_ssd(L, R)
[m,n] = size(L);
min = 0;
max = 100;
win = 4;
%choose the block and match it one by one
for i = 1+win:1:m-win
for j = 1+win:1:n-win-max
    pre = 2^20;        
    temp = 0;        
    value = min;
    for r = min:1:max
        cur = 0 ;
        %calculte by formula of ssd
    for x = -win:1:win
    for y = -win:1:win
        if j+y+r <= n
            temp = abs(L(i+x,j+y)-R(i+x,j+y+r));
            temp = temp*temp;
            cur = cur+temp;
        end
    end
    end
        if pre > cur 
            pre = cur;
            value = r;
        end
    end
    out(i,j) = value;
end
end