function thres = intermeans_9(im)
%Implements a intermeans algorithm and computes a threshold for binarizing an image


thres = round(uint8(mean2(im)));
thres_prev = thres + 1;

while thres_prev ~= thres
    thres_prev = thres;
    [h,D]=imhist(im);
    meanLo = sum(D(1:thres_prev).*h(1:thres_prev))/sum(h(1:thres_prev));
    meanHi = sum(D(double(thres_prev+1):max(D)+1).*h(double(thres_prev)+1:max(D)+1))/sum(h(double(thres_prev+1):max(D)+1));
    thres = round(( meanLo + meanHi ) / 2);
end

thres = thres/max((D));