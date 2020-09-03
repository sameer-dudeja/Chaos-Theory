clc
myStream=RandStream('dsfmt19937');
img = rgb2gray(imread('im4.jpg'));
% r1 = imread('result111.jpg');
                                                    % a = zeros(size(img,1),size(img,2));
                                                    % just_red = cat(3,red,a,a);
                                                    % just_green = cat(3,a,green,a);
                                                    % just_blue = cat(3,a,a,blue);
                                                    % recom = cat(3,red,green,blue);
                                                    % imshow(recom);
[m,n,k]=size(img);
l = min(round(sqrt(m)),round(sqrt(n))); 
L=l*l;
I = img;
[Key] = keygen(myStream);
for N = 1:4
       if(N==1)
                X0(N) = single(mod((Key(1)*Key(4)+Key(3)*Key(5)),1));
                P0(N) = single(mod((Key(2)*Key(4)+Key(3)*Key(5)),1));
                X0
                P0
       end         
       if(N==2)
                X0(N) = single(mod((Key(1)*Key(4)+Key(3)*Key(6)),1));
                P0(N) = single(mod((Key(2)*Key(4)+Key(3)*Key(6)),1));
                X0
                P0
       end        
       if(N==3)
                 X0(N) = single(mod((Key(1)*Key(4)+Key(3)*Key(7)),1));
                 P0(N) = single(mod((Key(2)*Key(4)+Key(3)*Key(7)),1));
                 X0
                P0
       end   
       if(N==4)
                 X0(N) = single(mod((Key(1)*Key(4)+Key(3)*Key(8)),1));
                 P0(N) = single(mod((Key(2)*Key(4)+Key(3)*Key(8)),1));
                 X0
                 P0   
       end
     X = lsc_py(4*L,X0(N),P0(N));
     X1 = lsc_py(L,X0(N),P0(N));
                                    %     if(size(img,3)==3)
                                    %             red = img(:,:,1);
                                    %             green = img(:,:,2);
                                    %             blue = img(:,:,3);
                                    %             T1 = scrambling(red,X);
                                    %             T2 = scrambling(green,X);
                                    %             T3 = scrambling(blue,X);
                                    %             T = cat(3,T1,T2,T3);
                                    %             imrotate(T,90);
                                    %             C1 = uint8(ROS(T1,X1,L));
                                    %             C2 = uint8(ROS(T2,X1,L));
                                    %             C3 = uint8(ROS(T3,X1,L));
                                    %             C = cat(3,C1,C2,C3);
                                    %             
                                    % %     else
        T = scrambling(I,X);
        imrotate(T,90);  
        C = (ROS(T,X1,L));
% %     end
        I = C;
end
figure
imshow(I);
xlabel('Encrypted Image');
figure
imshow(img);
xlabel('Orignal Image');
% % imwrite(C,'encr.jpg');
% figure
% imshow('encr.jpg');
[x1,p1,K] = LSC_Decryption(Key,I);
figure
imshow(K);
xlabel('Decrypted');
