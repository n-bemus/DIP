Im = imread('XHelmet.jpg');
Im = rgb2gray(Im);
Im = im2double(Im);

figure(1);
imshow(Im);

imSaltPep = imnoise(Im , 'salt & pepper', .1);

figure(2);
imshow(imSaltPep);

imMedian = medfilt2(imSaltPep);

figure(3);
imshow(imMedian);
