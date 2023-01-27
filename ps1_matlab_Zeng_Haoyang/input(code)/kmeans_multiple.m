function [ids,means,ssd] = kmeans_multiple(X,K,iters,R)
ssdmin = 2^1024 %Define a value that is huge enough 
[m,n] = size(X);
best_center = zeros(K,n);
best_res = zeros(m,n+1);
for r = 1 : R %Do R times random start
res = zeros(m,n+1); %The n+1 line used to show ids
means = zeros(K,n); 
res(:,1:n)=X(:,:);
iter = 0;
for x = 1:K
    means(x,:)=X(randi(m,1),:); %Randomly generate cluster center
end
while 1
while 1
distence = zeros(1,K); 
num = zeros(1,K); 
new_center = zeros(K,n);
ssd = 0;
for x = 1:m
    for y = 1:K
    distence(y) = norm(X(x,:) - means(y,:)); %Calculate the distance to each cluster
    end
    [~, temp] = min(distence); %Get the number of nearest cluster
    ssd = ssd + min(distence)^2; %Get ssd
    res(x,n+1) = temp;         
end
k = 0;
for y = 1:K
    for x = 1:m
        if res(x,n+1) == y
           new_center(y,:) = new_center(y,:) + res(x,1:n); %Add up all the points that belong to the same group
           num(y) = num(y) + 1;
        end
    end
    new_center(y,:) = new_center(y,:) / num(y); %Get the new central point
    if norm(new_center(y,:) - means(y,:)) < 0.1
        k = k + 1;
    end
end
if k == K %When the offset of all the central points is less than the threshold, the central point remains the same.
     break;
else
     means = new_center; %Get the new_center
end
end
iter = iter + 1;
if iter == iters %run iters times
    break;
end
end
if ssd < ssdmin
    ssdmin = ssd %when get a smaller sdd, sddmin to store the value
    best_center = means; %best_center to store the means when the sdd is the smallest
    best_res = res; %best_res to store the ids when the sdd is the smallest
end
end
[m, n] = size(res);
ids = best_res(:,n); %get the ids with smallest ssd;
ssd = ssdmin; %get the smallest ssd;
means = best_center; %get the center with smallest ssd;
hold on;
grid on;
end