function [H, theta, rho] = hough_lines_acc(img_edges);
BW = img_edges;
theta = (-90:0.5:89); %initilize theta;
[M,N] = size(img_edges);
D = sqrt((M-1)^2+(N-1)^2);
rhoResolution = 0.5;
Bound = ceil(D/rhoResolution) * rhoResolution;
rho = (-Bound:rhoResolution:Bound); %initilize tho;
H = zeros(length(rho),length(theta)); %initilize H;
cost = cos(theta*pi/180);
sint = sin(theta*pi/180);
%get the value of H matrix
for y = 1:M
    for x = 1:N
        if BW(y,x)
            r = (x-1)*cost+(y-1)*sint;
            r = round(r/rhoResolution)+ceil(D/rhoResolution)+1;
            for k = 1:length(theta*pi/180)
                H(r(k),k) = H(r(k),k)+1;
            end
        end
    end
end
end