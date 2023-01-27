I = imread('ps2-input0-noise.png');
smooth = imgaussfilt(I,2)
BW = edge(smooth, 'canny')
[H,T,R] = hough_lines_acc(BW);
P  = hough_peaks(H,6);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');
hough_lines_draw(I,P,R,T)