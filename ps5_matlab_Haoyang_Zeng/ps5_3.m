ka1 = fa(1:2,matches(1,:));
kb1 = fb(1:2,matches(2,:));
ka1 = ka1';
kb1 = kb1';
init = 0;
length = size(ka1, 1);
for i = 1:1000
    as = [];
	bs = [];
	random = randperm(length, 8);
    ra = ka1(random, :);
	rb = kb1(random, :);
    [s, ~] = size(ra);
    Pic = zeros(s, 9);
    ua = ra(:,1);
    va = ra(:,2);
    ub = rb(:,1);
    vb = rb(:,2);
    for j = 1 : s
	    Pic(j, :) = [ua(j) * ub(j), va(j) * ub(j), ub(j), ua(j) * vb(j), va(j) * vb(j), vb(j), ua(j), va(j), 1];
    end
%use the svd func
    [U1,S1,V1] = svd(Pic);
    f = V1(:,9);
    F = reshape(f,[3 3])';
    [U2,S2,V2] = svd(F);
    S2(3,3) = 0;
    F = U2*S2*V2';
    nums = 0;
	for n = 1 : length
	    err = [kb1(n, :) 1] * F * [ka1(n, :) 1]';
		if abs(err) < 0.005
		    as(n, :) = ka1(n, :);
			bs(n, :) = kb1(n, :);
			nums = nums + 1;
	    end
	end
    if nums > init
        best = F;
		ia = as;
		ib = bs;
        init = nums;
    end
end
                    
figure;
showMatchedFeatures(F1,F2,ia,ib,"montage",PlotOptions=["yo","yo","y"]);  

figure; 
subplot(1,2,1);
imshow(F1); 
epiLines = epipolarLine(best,ib);
points = lineToBorderPoints(epiLines,size(F1));
line(points(:,[1,3])',points(:,[2,4])');                        

subplot(1,2,2);
imshow(F2); 
epiLines = epipolarLine(best',ia);
points = lineToBorderPoints(epiLines,size(F2));
line(points(:,[1,3])',points(:,[2,4])');
