X_train = zeros(100,1188);
Y_train = zeros(100,1);
for i = 1 : 9
A = 'input/p1/train_imgs/0_0';
B = '.jpg';
C = num2str(i);
D = [A,C,B];
I = imread(D);
[hog,visualzation] = extractHOGFeatures(I);
X_train(i,:) = hog(1,:);
Y_train(i,:) = 0;
end
for i = 10 : 50
A = 'input/p1/train_imgs/0_';
B = '.jpg';
C = num2str(i);
D = [A,C,B];
I = imread(D);
[hog,visualzation] = extractHOGFeatures(I);
X_train(i,:) = hog(1,:);
Y_train(i,:) = 0;
end
for i = 1 : 9
A = 'input/p1/train_imgs/0_0';
B = '.jpg';
C = num2str(i);
D = [A,C,B];
I = imread(D);
[hog,visualzation] = extractHOGFeatures(I);
X_train(i + 50,:) = hog(1,:);
Y_train(i + 50,:) = 1;
end
for i = 10 : 50
A = 'input/p1/train_imgs/0_';
B = '.jpg';
C = num2str(i);
D = [A,C,B];
I = imread(D);
[hog,visualzation] = extractHOGFeatures(I);
X_train(i + 50,:) = hog(1,:);
Y_train(i + 50,:) = 1;
end
Mdl = fitcsvm(X_train,Y_train);

