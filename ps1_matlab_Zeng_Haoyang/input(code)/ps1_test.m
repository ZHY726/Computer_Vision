clear all;
close all;
clc;
a = [0 0 ];  
S1 = [.1 0 ;0 .1];  
data1 = mvnrnd(a,S1,100);
b = [0 0 ];
S2=  [.1 0 ;0 .1];
data2 = mvnrnd(b,S2,100);
c = [0 0 ];
S3 = [.1 0 ;0 .1];
data3 = mvnrnd(c,S3,100);
%Show randomly generated points
plot(data1(:,1),data1(:,2),'r+');
hold on;
plot(data2(:,1),data2(:,2),'b*');
plot(data3(:,1),data3(:,2),'go');
grid on;
%Three types of data are combined into one data class
data = [data1;data2;data3];
[ids,means,ssd] = kmeans_single(data,3,5);
[m,n] = size(data);
res = zeros(m,n+1);
res(:,1:n) = data(:,:);
res(:,n+1) = ids(:,:);
[m,n] = size(res);
figure;
hold on;
%Show the result of using kmeans_single/multiple
for i = 1:m
    if res(i,n) == 1 
         plot(res(i,1),res(i,2),'r+');
         plot(means(1,1),means(1,2),'ko');
    elseif res(i,n) == 2
         plot(res(i,1),res(i,2),'b*');
         plot(means(2,1),means(2,2),'ko');
    elseif res(i,n) == 3
         plot(res(i,1),res(i,2),'go');
         plot(means(3,1),means(3,2),'ko');
    else
         plot(res(i,1),res(i,2),'m*');
         plot(means(4,1),means(4,2),'ko');
    end
end
grid on