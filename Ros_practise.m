clc
% myStream=RandStream('dsfmt19937');
img = rgb2gray(imread('im4.jpg'));
X0 = 1.5823;
P0 = 1.4824;
[m,n,k]=size(img);
l = min(floor(sqrt(m)),floor(sqrt(n)));
L=l*l;
X1 = lsc_py(L,X0,P0);
C = (ROS(img,X1,L));
T = (ROS_Decryp(C,X1,L)); 
figure
imshow(C);
xlabel('Encrypted Image');
figure
imshow(T);
xlabel('Decrypted Image'); 
figure
U = uint8(T);
imshow(U);