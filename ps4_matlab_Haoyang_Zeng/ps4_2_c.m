I1 = imread('pic_a.jpg');
figure; 
imshow(I1); 
epiLines = epipolarLine(F,picb);
points = lineToBorderPoints(epiLines,size(I1));
line(points(:,[1,3])',points(:,[2,4])');