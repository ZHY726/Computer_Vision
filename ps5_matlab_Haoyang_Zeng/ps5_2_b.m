[matches, scores] = vl_ubcmatch(da, db) ;

imshowpair(F1,F2,'montage')
hold on
for i = 1 : 160
    ka1 = fa(:,matches(1,i));
    kb1 = fb(:,matches(2,i));
    plot([ka1(1,1) kb1(1,1)+n],[ka1(2,1) kb1(2,1)],'G')
end 

