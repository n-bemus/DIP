Im = imread('XHelmet.jpg');
Im = rgb2gray(Im);
Im = im2double(Im);

figure(1);
imshow(Im);

BlurFilter = fspecial('motion',30,50);
ImBlur = imfilter(Im,BlurFilter,'replicate');

figure(2);
imshow(ImBlur);

ImNoisy = imnoise(ImBlur, 'Gaussian', 0, .001);

figure(3);
imshow(ImNoisy);

ImInverse = deconvlucy(ImNoisy, BlurFilter);

figure(4);
imshow(ImInverse);

ImWiener = deconvwnr(ImNoisy, BlurFilter, .01);

figure(5);
imshow(ImWiener);

ImREG = deconvreg(ImNoisy, BlurFilter, .01);

figure(6);
imshow(ImREG);
