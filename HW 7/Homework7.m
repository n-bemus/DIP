clc;
clear all;

im = imread('lena.bmp');
im = rgb2ycbcr(im);
im = im(: , :, 1);

figure(1);
imshow(im);

[C, S] = wavedec2 (im, 5, 'bior3.3');

% Compute start indexes for each portion of the image.
% The portion that the start index is for is specified by the comment
% to the right.
startIndexes = zeros(17, 1);
startIndexes(1) = 1; % Approximation
startIndexes(2) = 1 + S(2, 1)*S(2, 1); % HD5
startIndexes(3) = startIndexes(1) + S(2, 1)*S(2, 1); % VD5
startIndexes(4) = startIndexes(2) + S(2, 1)*S(2, 1); % DD5
startIndexes(5) = startIndexes(3) + S(2, 1)*S(2, 1); % HD4

startIndexes(6) = startIndexes(4) + S(3, 1)*S(3, 1); % VD4
startIndexes(7) = startIndexes(5) + S(3, 1)*S(3, 1); % DD4
startIndexes(8) = startIndexes(6) + S(3, 1)*S(3, 1); % HD3
startIndexes(9) = startIndexes(7) + S(4, 1)*S(4, 1); % VD3
startIndexes(10) = startIndexes(8) + S(4, 1)*S(4, 1); % DD3
startIndexes(11) = startIndexes(9) + S(4, 1)*S(4, 1); % HD2
startIndexes(12) = startIndexes(10) + S(5, 1)*S(5, 1); % VD2
startIndexes(13) = startIndexes(11) + S(5, 1)*S(5, 1); % DD2
startIndexes(14) = startIndexes(12) + S(5, 1)*S(5, 1); % HD1
startIndexes(15) = startIndexes(13) + S(6, 1)*S(6, 1); % VD1
startIndexes(16) = startIndexes(14) + S(6, 1)*S(6, 1); % DD1
startIndexes(17) = 275278; % End index


% Thresholds to be used in compressing Lena.
thresholds = zeros(16, 1);
thresholds(1) = 1; % Approximation
thresholds(2) = 51; % HD5
thresholds(3) = 41; % VD5
thresholds(4) = 26; % DD5
thresholds(5) = 11; % HD4
thresholds(6) = 11; % VD4
thresholds(7) = 21; % DD4
thresholds(8) = 11; % HD3
thresholds(9) = 11; % VD3
thresholds(10) = 31; % DD3
thresholds(11) = 11; % HD2
thresholds(12) = 6; % VD2
thresholds(13) = 16; % DD2
thresholds(14) = 6; % HD1
thresholds(15) = 8; % VD1
thresholds(16) = 33; % DD1


% Thresholded C
cThresholded = zeros(1, 275278);
% Threshold each portion of the image and create the new C

for i = 1:16
portion = C(startIndexes(i):startIndexes(i+1));
portion(find(abs(portion)<thresholds(i))) = 0;
cThresholded(startIndexes(i):startIndexes(i+1)) = portion;
end

% Reconstruct Lena from the thresholded C
imCompressed = waverec2(cThresholded, S, 'bior3.3');
figure(2)
imshow(uint8(imCompressed));
disp(length(find(cThresholded==0)));