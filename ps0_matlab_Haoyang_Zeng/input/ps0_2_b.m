F1 = imread('ps0-1-a-1.png');
F1(:,:,1) = 0;
F1(:,:,3) = 0;
G = F1(:,:,2);
G = double(G);
[m,n,x] = size(F1);
max = 0;
min = 255;
sum = 0;
avg = 0;
var = 0;
dev = 0;
for i = 1:m
    for j = 1:n
        if G(i,j) > max
            max = G(i,j);
        end
        if G(i,j) < min
            min = G(i,j);
        end
        sum = sum + G(i,j);
    end
end
avg = sum /(m * n);
for i = 1:m
    for j = 1:n
        var = var + (G(i,j) - avg) ^ 2;
    end
end
dev = sqrt(var /(m * n));
imshow(F1), title('Green');