pts2d = [1.0486   -0.3645
            -1.6851   -0.4004
            -0.9437   -0.4200
             1.0682    0.0699
             0.6077   -0.0771
             1.2543   -0.6454
            -0.2709    0.8635
            -0.4571   -0.3645
            -0.7902    0.0307
             0.7318    0.6382
            -1.0580    0.3312
             0.3464    0.3377
             0.3137    0.1189
            -0.4310    0.0242
            -0.4799    0.2920
             0.6109    0.0830
            -0.4081    0.2920
            -0.1109   -0.2992
             0.5129   -0.0575
             0.1406   -0.4527]
pts3d = [1.5706   -0.1490    0.2598
            -1.5282    0.9695    0.3802
            -0.6821    1.2856    0.4078
             0.4124   -1.0201   -0.0915
             1.2095    0.2812   -0.1280
             0.8819   -0.8481    0.5255
            -0.9442   -1.1583   -0.3759
             0.0415    1.3445    0.3240
            -0.7975    0.3017   -0.0826
            -0.4329   -1.4151   -0.2774
            -1.1475   -0.0772   -0.2667
            -0.5149   -1.1784   -0.1401
             0.1993   -0.2854   -0.2114
            -0.4320    0.2143   -0.1053
            -0.7481   -0.3840   -0.2408
             0.8078   -0.1196   -0.2631
            -0.7605   -0.5792   -0.1936
             0.3237    0.7970    0.2170
             1.3089    0.5786   -0.1887
             1.2323    1.4421    0.4506]
%Initialize the data
[s, ~] = size(pts2d);
Pic = zeros(2*s, 12);
u = pts2d(:,1);
v = pts2d(:,2);
X = pts3d(:,1);
Y = pts3d(:,2);
Z = pts3d(:,3);
%transform to Direct linear calibration - homogeneous
for i = 1:s
    j = 2 * i;
    Pic(j - 1, :) = [X(i), Y(i), Z(i), 1, 0, 0, 0, 0, -u(i)*X(i), -u(i)*Y(i), -u(i)*Z(i), -u(i)];
	Pic(j, :)     = [0, 0, 0, 0, X(i), Y(i), Z(i), 1, -v(i)*X(i), -v(i)*Y(i), -v(i)*Z(i), -v(i)];
end
%use svd fun
[U,S,V] = svd(Pic);
m1 = V(:,12);
m2 = transpose(m1);
m = reshape(m2,[4,3])';
%use matrix calculation
M1 = [Pic(:,1:11)\Pic(:,12); -1];
M2 = transpose(M1);
M = [M2(1:4); M2(5:8); M2(9:12)];
pts3dt = transpose(pts3d);
pts3dn = [pts3dt;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
pts2dn = M * pts3dn;
pts2dt = transpose(pts2dn)
mypts2d = zeros(s,3);
resisum = 0;
%get the result of calcaulating u and v and residual
for i = 1:s
    mypts2d(i,1) = pts2dt(i,1)/pts2dt(i,3);
    mypts2d(i,2) = pts2dt(i,2)/pts2dt(i,3);
    mypts2d(i,3) = sqrt((mypts2d(i,1)-pts2d(i,1))^2+(mypts2d(i,2)-pts2d(i,2))^2);
    resisum = resisum + mypts2d(i,3);
end
%get the average
resiave = resisum/s
