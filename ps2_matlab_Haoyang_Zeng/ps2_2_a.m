I = imread('ps2-input0.png');
BW = edge(I,'Canny');
[H,T,R] = hough_lines_acc(BW);
P  = hough_peaks(H,10);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');