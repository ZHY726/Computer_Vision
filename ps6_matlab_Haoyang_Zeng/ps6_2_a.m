F1 = imread("yos_img_01.jpg");
F = im2double(F1);
[m,n] = size(F);
%intiialize the gaussian filter
gf = fspecial('gaussian',11,1);
g0 = imfilter(F, gf,'replicate');
g0r = imresize(g0,[round(m/2),round(n/2)]);
g1 = imfilter(g0r, gf,'replicate');
g1r = imresize(g1,[round(m/4),round(n/4)]);
g2 = imfilter(g1r, gf,'replicate');
g2r = imresize(g2,[round(m/8),round(n/8)]);
g3 = imfilter(g2r, gf,'replicate');
subplot(2,2,1);
imshow(g0);
title('level0')
subplot(2,2,2);
imshow(g1);
title('level1')
subplot(2,2,3);
imshow(g2);
title('level2')
subplot(2,2,4);
imshow(g3);
title('level3')