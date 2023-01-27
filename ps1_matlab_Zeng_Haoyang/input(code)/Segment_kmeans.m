function [im_out] = Segment_kmeans(im_in,K,iters,R)
org = imread(im_in); %Input image
figure;
subplot(2,2,1);
imshow(org),title('Origin'); %To show the origin                  
org = imresize(org,[100,100]); %Downsample the images
[m,n,a] = size(org);
% decompose the image into RGB--3 channels
A = reshape(org(:, :, 1), m*n, 1);   
B = reshape(org(:, :, 2), m*n, 1);
C = reshape(org(:, :, 3), m*n, 1);
data = [A B C]; %compose into one data
data = im2double(data);
[ids,means,ssd] = kmeans_multiple(data, K, iters, R); %Use kmeans_multiple       
result = reshape(ids, m, n); % Reverse conversion to picture form
subplot(2,2,2);
%Convert tag matrix to RGB image and show the result
im_out = im2uint8(label2rgb(result));
end