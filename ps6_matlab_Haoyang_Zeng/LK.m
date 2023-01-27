function [X1,Y1,M1,M2] = LK(I1,I2)
I1 = imresize(I1, 0.5);
I2 = imresize(I2, 0.5);
wsize = 25;
c1 = [-1,1;-1,1];
c2 = [-1,-1;1,1];
c3 = [1,1;1,1];
c4 = [-1,-1;-1,-1];
IX = conv2(I1, c1, 'valid');
IY = conv2(I1, c2, 'valid'); 
IT = conv2(I1, c3, 'valid') + conv2(I2, c4, 'valid');
l = size(I1);
m1 = zeros(l);
m2 = zeros(l);

for i = wsize+1:size(IX,1)-wsize
   for j = wsize+1:size(IX,2)-wsize
      Ix = IX(i-wsize:i+wsize, j-wsize:j+wsize);
      Iy = IY(i-wsize:i+wsize, j-wsize:j+wsize);
      It = IT(i-wsize:i+wsize, j-wsize:j+wsize);
      x = Ix(:);
      y = Iy(:);
      T = -It(:);
      A = [x y];
      M = pinv(A) * T;
      m1(i,j)=M(1);
      m2(i,j)=M(2);
   end
end
[m3,n3] = size(I1);
m = 2 * m3;
n = 2 * n3;
[X, Y] = meshgrid(1:n, 1:m);
[lm, ln] = size(m1);
[lx, ly] = size(X);
M1 = m1(1:10:lm, 1:10:ln);
M2 = m2(1:10:lm, 1:10:ln);
X1 = X(1:20:lx, 1:20:ly);
Y1 = Y(1:20:lx, 1:20:ly);

end