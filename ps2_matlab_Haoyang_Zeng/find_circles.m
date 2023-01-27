function [centers,radii] = find_circles(img_edges,r_min,r_max)
step_angle = 0.1
p = 0.9
circle=[];  
centers=[]; 
radii=[];
[m,n] = size(img_edges);  
rs = r_max-r_min+1;
ra = round(2*pi/step_angle);  
hough_space = zeros(m,n,rs);  
[rows,cols] = find(img_edges);%find the rows and cols of val = 1;
count = size(rows);
%Correspond the image space(x,y) to the parameter space (a,b,r) 
%because the value of r is not fixed.
for i=1:count  
    for r=1:rs  
        for k=1:ra 
            a = round(rows(i)-(r_min+(r-1))*cos(k*step_angle));  
            b = round(cols(i)-(r_min+(r-1))*sin(k*step_angle));  
            if(a > 1 & a < m & b > 1 & b < n)  
                hough_space(a,b,r) = hough_space(a,b,r)+1; 
            end  
        end  
    end  
end  
% Search for points that exceed the threshold.
max_para = max(max(max(hough_space))); 
% In a matrix, find the position where it is greater than the threshold
sat = find(hough_space>=max_para*p); 
length = size(sat);                 
%get the paremeters of different circles which are satisfied  
for k=1:length  
    p3 = floor(sat(k)/(m*n))+1; 
    p2 = floor((sat(k)-(p3-1)*(m*n))/m)+1;  
    p1 = sat(k)-(p3-1)*(m*n)-(p2-1)*m;  
    circle = [circle;p1,p2,p3]; 
end  
%The points concentrated at the center of each circle are averaged to get 
%the exact center and radius for each circle. 
while size(circle,1) >= 1  
    num = 1;  
    newcircle = [];  
    temp1 = circle(1,1);  
    temp2 = circle(1,2);  
    temp3 = circle(1,3);  
    c1 = temp1;  
    c2 = temp2;  
    c3 = temp3;  
    temp3 = r_min+temp3-1;  
    if size(circle,1) > 1       
        for k = 2:size(circle,1)  
          if (circle(k,1)-temp1)^2+(circle(k,2)-temp2)^2 > temp3^2  
             %Save the center and radius position of the remaining circle
             newcircle = [newcircle;circle(k,1),circle(k,2),circle(k,3)]; 
          else    
            c1 = c1+circle(k,1);  
            c2 = c2+circle(k,2);  
            c3 = c3+circle(k,3);  
            num = num+1;  
          end   
        end  
    end    
    c1 = round(c1/num);  
    c2 = round(c2/num);  
    c3 = round(c3/num);  
    c3 = r_min+c3-1;       
    centers = [centers;c1,c2];
    radii = [radii;c3];
    circle = newcircle;  
end
end