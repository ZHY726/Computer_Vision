I = imread('ps2-input2.png');
gray = rgb2gray(I);
smooth = imgaussfilt(gray,10)
BW = edge(smooth, 'canny')
[H,T,R] = hough_lines_acc(BW);
P = hough_peaks(H,20);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');
figure, imshow(smooth), hold on
hough_lines_draw(I,P,R,T)