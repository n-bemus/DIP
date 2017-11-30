close all; 
clear; 
clc;

im =imread('Fruit.jpg');
im = double(im);

figure(1);
imshow(im);

Size = 512;

Red = 70;
Green = 84;
Blue = 119;

gray = 140;

MaxDistance = 50;

Sliced = zeros(Size, Size, 3);

for i = 1:Size
    for j = 1:Size
        thisR = im(i, j, 1);
        thisG = im(i, j, 2);
        thisB = im(i, j, 3);
        
        distance = sqrt((Red - thisR)^2 + (Green - thisG)^2 + (Blue - thisB)^2);
        
        if distance <= MaxDistance
            Sliced(i, j, 1) = Red;
            Sliced(i, j, 2) = Green;
            Sliced(i, j, 3) = Blue;
        else
            Sliced(i, j, :) = gray;
        end
    end
end

figure(2)
imshow(uint8(Sliced));