function [g0,g1,g2,g3] = gaussian(F1)
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
end