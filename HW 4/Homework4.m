close all; 
clear; 
clc;

close all;clear;clc;
im1 = imread('Cuphead','jpg');
im1 = im1(:,:,1);

figure(1)
imshow(im1, [min(min(im1)), max(max(im1))]);

impad=zeros(600,600);
impad(1:300,1:300)=im1;

p(1:2:600)=ones(1,300);
p(2:2:600)=-ones(1,300);

y=p'*p;
im3=impad.*y;
im4=fft2(im3);

im2=zeros(600,600);
d=150;
n=2;
for i=1:600
    for j=1:600
        im2(i,j) = exp(1)^(-(((i - 300) ^ 2 + (j - 300) ^ 2) / (2 * d ^ 2)));
    end
end

im5=im4.*im2;
im6=real(ifft2(im5));
im7=im6.*y;
im8=im7(1:300,1:300);

figure(2)
imshow(log(abs(im5)+1),[min(min(log(abs(im5)+1))) max(max(log(abs(im5)+1)))]);

figure(3)
imshow(im8,[0 255])