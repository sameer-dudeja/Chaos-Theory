clc
myStream=RandStream('swb2712');
img = (imread('im5.jpg'));
 [M,N,k]=size(img);
    m = M;
    n = N;
    l = min(round(sqrt(m)),round(sqrt(n)));
    L=l*l;
% a = zeros(size(img,1),size(img,2));
% just_red = cat(3,red,a,a);
% just_green = cat(3,a,green,a);
% just_blue = cat(3,a,a,blue);
% recom = cat(3,red,green,blue);
% imshow(recom);
for N = 1:4
    
    [xold,R] = keygen(myStream);
    N
    xold
     X = lsc_py(4*L,xold,R);
    if(size(img,3)==3)
            red = img(:,:,1);
            green = img(:,:,2);
            blue = img(:,:,3);
            T1 = scrambling(red,X);
            T2 = scrambling(green,X);
            T3 = scrambling(blue,X);
            T = cat(3,T1,T2,T3);
            figure
            imshow(T);
            xlabel('Scambling');
    else
        T = scrambling(img,X);
        figure
        imshow(T);
    end
%     figure
%     imshow(img);
    C1 = uint8(ROS(T1,xold,L,R));
    C2 = uint8(ROS(T2,xold,L,R));
    C3 = uint8(ROS(T3,xold,L,R));
    C = cat(3,C1,C2,C3);
    img = C;
    figure
    imshow(C);
    xlabel('ROS');
end