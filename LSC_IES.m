clc
myStream=RandStream('swb2712');
Image =(imread('image2.jpg'));
[xold,R] = keygen(myStream);
T = scrambling(Image,xold,R);
figure
imshow(T);