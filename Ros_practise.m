clc
% myStream=RandStream('dsfmt19937');
img = rgb2gray(imread('im4.jpg'));
A = im2double(img);
X0 = 0.6515;
P0 = 0.4647;  
    
[m,n,k]=size(img);
l = min(floor(sqrt(m)),floor(sqrt(n)));
L=l*l;
X1 = lsc_py(L,X0,P0);
X1= uint8(X1);
X = lsc_py(4*L,X0,P0);
X= uint8(X);
% for i =1:1
    P = scrambling(A,X);
%     img = imrotate(img,90);
%     img  = uint8(img);
    figure 
    imshow(P);
    xlabel('scramb');
    C = (ROS(P,X1,L));
%     C = uint8(C);
%     img = C;
    
% end
% T = imrotate(T,-90);

figure
imshow(C);
xlabel('only Scrambling Encrypted Image');
% 
% for i = 1:4
% C = im2double(C);
T = (ROS_Decryp(C,X1,L)); 
% T = uint8(T);
    figure 
    imshow(T);
    xlabel('ROS uint');
% T = imrotate(T,-90);
K = decry_scramb(T,X);
% C = K;
% end
figure
imshow(K);
xlabel('only Scrambling Decrypted Image'); 
