im = imread('lowPenguin.jpg');
im = im(:, :, 1);
 
[x, counts] = imhist(uint8(im));
stem(counts, x);
 
dark = 45;
gray = 80;
bright = 115;
 
vd = 50;
vg = 125;
vb = 200;
 
im = double(im);
 
mem = zeros(192, 267, 3);
enhanced = zeros(192, 267);
 
for i = 1:192
    for j = 1:267
        if im(i,j) <= dark
            mem(i, j, 1) = 1;
        elseif im(i, j) <= gray
            mem(i, j, 1) = 1 - ((im(i,j) - dark) / (gray - dark));
            mem(i, j, 2) = 1 - mem(i, j, 1);
        elseif im(i, j) <= bright
            mem(i, j, 2) = 1 - ((im(i,j) - gray) / (bright - gray));
            mem(i, j, 3) = 1 - mem(i, j, 2);
        else
            mem(i, j, 3) = 1;
        end
        
        enhanced(i,j) = ((mem(i, j, 1) * vd) + (mem(i, j, 2) * vg) + (mem(i, j, 3) * vb)) / (mem(i, j, 1) + mem(i, j, 2) + mem(i, j, 3)); 
        
    end
end
 
%Display New Image
figure(2);
imshow(uint8(enhanced));

figure(3);
[x counts] = imhist(uint8(enhanced));
stem(counts, x);