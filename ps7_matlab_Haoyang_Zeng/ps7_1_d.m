I1 = imread('input/p1/test_imgs/0_05.jpg');
I = im2gray(I1);
[m,n] = size(I);
wx = 96;
wy = 32;
mi = zeros(wx,wy);
mi = im2uint8(mi);
mi(:,:) = I(1:96,33:64);
[hog,visualzation] = extractHOGFeatures(mi);
[label,score] = predict(Mdl, hog);
res = zeros(1,3);
count = 1;
for i = 1 : 96
    for j = 1 : 160
        mi(:,:) = I(i:i+95,j:j+31);
        [hog,visualzation] = extractHOGFeatures(mi);
        [label,score] = predict(Mdl, hog);
        if label(:,1) == 1
            res(count,1) = score(:,2);
            res(count,2) = i;
            res(count,3) = j;
            count = count + 1;
        end
    end
end
[x,y] = size(res);
max = 0;
maxi = 0;
maxj = 0;
for i = 1 : x
    if(res(i,1) > max)
        max = res(i,1);
        maxi = res(i,2);
        maxj = res(i,3);
    end
end
imshow(I1)
hold on;
rectangle('Position',[maxi,maxj,32,96],'EdgeColor','g',LineWidth = 2);


