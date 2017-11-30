close all; 
clear; 
clc;

im =imread('south_park.jpg');
figure(1);
imshow(im);

width = 1296;
height = 730;

imYCBCR = rgb2ycbcr(im);
figure(2)
imshow(imYCBCR);

CB = zeros(height/2, width/2);
CR = zeros(height/2, width/2);

for i = 1:height/2
    for j = 1:width/2
        CB(i,j) = imYCBCR(i*2, j*2, 2);
        CR(i,j) = imYCBCR(i*2, j*2, 3);
    end
end

figure(3)
imshow(uint8(CB));

figure(4)
imshow(uint8(CR));

tScale = affine2d([2 0 0; 0 2 0; 0 0 1]);
bigCB = imwarp(CB, tScale, 'bicubic');
bigCR = imwarp(CR, tScale, 'bicubic');

reconstructed = zeros(height, width, 3);
reconstructed(:, :, 1) = imYCBCR(:, :, 1);
reconstructed(:, :, 2) = bigCB;
reconstructed(:, :, 3) = bigCR;
reconstructed = ycbcr2rgb(uint8(reconstructed));

figure(5)
imshow(uint8(reconstructed));
