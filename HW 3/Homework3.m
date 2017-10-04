A = imread('xrayLefthand', 'jpg');
A = A(:, :, 1);
A = double(A);

figure(1);
imshow(A, [min(min(A)), max(max(A))]);

figure(2);
LF = fspecial('Laplacian');
B = imfilter(A, LF);
imshow(B, [min(min(B)), max(max(B))]);

figure(3);
C = A + B;
imshow(C, [min(min(C)), max(max(C))]);

figure(4);
SF = fspecial('Sobel');
D = imfilter(A, SF);
imshow(D, [min(min(D)), max(max(D))]);

figure(5);
E = imgaussfilt(D, 5);
imshow(E, [min(min(E)), max(max(E))]);

figure(6);
F = abs(E) .* abs(C);
imshow(F, [min(min(F)), max(max(F))]);

figure(7);
G = abs(A) + abs(F);
imshow(G, [min(min(G)), max(max(G))]);

figure(8);
GC= A / max(max(A));
Gamma = .5;
Constant = 256;
H = Constant .* GC .^ Gamma;
imshow(H, [min(min(H)), max(max(H))]);