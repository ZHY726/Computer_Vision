F1 = imread("yos_img_01.jpg");
F = im2double(F1);
[m,n] = size(F);
gf = fspecial('gaussian',11,1);
g0 = imfilter(F, gf,'replicate');
g0r = imresize(g0,[round(m/2),round(n/2)]);
g1 = imfilter(g0r, gf,'replicate');
g1r = imresize(g1,[round(m/4),round(n/4)]);
g2 = imfilter(g1r, gf,'replicate');
g2r = imresize(g2,[round(m/8),round(n/8)]);
g3 = imfilter(g2r, gf,'replicate');
l1r = imresize(g1,[m,n]);
l0 = g0 - l1r;
l2r = imresize(g2,[round(m/2),round(n/2)]);
l1 = g1 - l2r;
l3r = imresize(g3,[round(m/4),round(n/4)]);
l2 = g2 - l3r;
subplot(2,2,1);
imshow(g0);
title('level0')
subplot(2,2,2);
imshow(l0,[]);
title('level1')
subplot(2,2,3);
imshow(l1,[]);
title('level2')
subplot(2,2,4)
imshow(l2,[]);
title('level3')