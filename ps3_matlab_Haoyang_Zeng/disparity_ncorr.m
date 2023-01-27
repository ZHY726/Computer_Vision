function [out] = disparity_ncorr(L, R)
[m,n] = size(L);
min = 0;
max = 100;
win = 4
%choose the block and match it one by one
for i = 1+win:1:m-win 
for j = 1+win:1:n-win-max 
    pre = 0;
    value = min;
    for r = min:1:max
        cur = 0; 
        N = 0; 
        D = 0; 
        rwin = 0; 
        lwin = 0;
        %calculte by formula of ncorr
            for x = -win:1:win
            for y = -win:1:win
                rwin = rwin+(R(i+x,j+y)*R(i+x,j+y));
                lwin = lwin+(L(i+x,j+y+r)*L(i+x,j+y+r));
                N = N+(R(i+x,j+y)*L(i+x,j+y+r));
            end
            end
            D = sqrt(rwin*lwin);
            cur = N/D;
            if pre < cur
               pre = cur;
               value = r;
            end
        end
        out(i,j) = value;
end
end