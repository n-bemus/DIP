close all; 
clear; 
clc;

im =imread('Mugman.jpg');
im = im(:, :, 1);
figure(1);
imshow(im);

im = double(im);
rows = 600;
cols = 600;

gauss_std = 100;

imNoise = (gauss_std .* randn(rows, cols)) + im;
figure(2);
imshow(imNoise, [min(min(imNoise)), max(max(imNoise))]);

extend = zeros([rows*3, cols*3]);

for i = 1:rows
    for j = 1:cols
        extend(rows + i, cols + j) = imNoise(i,j);
        extend(rows + i, j) = imNoise(i, cols + 1 - j);
        extend(rows + i, 2*cols + j) = imNoise(i, cols + 1 -j);
    end
end

for i = 1:rows
    for j = 1:cols*3
        extend(i, j) = extend(rows + 1 + rows - i, j);
        extend(i + 2*rows, j) = extend(2*rows + 1 - i, j);
    end
end

windowSize = 11;

a = (windowSize - 1) /2;

means = zeros(rows, cols);
std = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        window = extend(rows + i - a: rows + i + a, cols + j - a: cols + j + a);
        means(i, j) = 1 / (windowSize*windowSize) * sum(sum(window));
        
        win1 = window - means(i,j);
        win2 = win1 .* win1;
        
        std(i, j) = 1/ (windowSize * windowSize) * sum(sum(win2));
    end
end

enhance = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        enhance(i, j) = imNoise(i, j) - (gauss_std * gauss_std / std(i, j) * (imNoise(i, j) - means(i, j)));
    end
end

figure(3);
imshow(enhance, [min(min(enhance)) , max(max(enhance))]);
