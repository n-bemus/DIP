clc;
clear all;
Im = imread('Xray.jpeg');
Im = rgb2gray(Im);
Im = im2double(Im);

figure(1);
imshow(Im);

s = [1 1 1; 1 1 1; 1 1 1] / 25;
a = imfilter(Im, s);

figure(2);
imshow(a);

ProcessedIm = histeq(a);
figure(3)
imshow(ProcessedIm);