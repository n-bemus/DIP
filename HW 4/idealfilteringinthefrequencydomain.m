close all;clear;clc;
im1=imread('Cuphead','jpg');
im1 = im1(:,:,1);
impad=zeros(600,600);
impad(1:300,1:300)=im1;
p(1:2:600)=ones(1,300);
p(2:2:600)=-ones(1,300);
y=p'*p;
im3=impad.*y;
im4=fft2(im3);
%im2=imread('ideal filter','bmp');
im2=zeros(600,600);
%r1=100;
%r2=0;
d=10;
n=2;
for i=1:600
    for j=1:600
        im2(i,j) = exp(1)^(-(((i - 300) ^ 2 + (j - 300) ^ 2) / (2 * d ^ 2)));
%              im2(i,j)=1/(1+(((i-256)^2+(j-256)^2)/d^2)^n);
%         if ((i-256)^2+(j-256)^2<r1^2) & ((i-256)^2+(j-256)^2>r2^2)
%             im2(i,j)=1;
%         end
    end
end
%im2=1-im2;
im5=im4.*im2;
im6=real(ifft2(im5));
im7=im6.*y;
im8=im7(1:300,1:300);
figure(1)
imshow(log(abs(im5)+1),[min(min(log(abs(im5)+1))) max(max(log(abs(im5)+1)))]);
figure(2)
imshow(im8,[0 255])
%e1=sum(sum(abs(im4).^2));
%e2=sum(sum(abs(im5).^2));
%e2/e1


