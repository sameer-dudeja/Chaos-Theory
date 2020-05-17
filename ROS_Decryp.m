function [E] = ROS_Decryp(T,X,L)
    % img = (imread('im3.jpg'));
    % T = img;
    [M,N,K] = size(T);
    T = im2double(T);
    % L=1024;
    % xold = 0.8;
%     X = lsc_py(L,xold,R);
    [X1,I] = sort(X);
    E = ones(L,L);
    for i = 1:N
        for j = 2:N
        E(I(i,j),j)= mod(T(I(i,j),j)-T(I(i,j-1),j-1)-round((2^32)*X(I(i,j),j)),256);
        end
    end
    for i = 2:N
        for j = 1            
        E(I(i,j),j)= mod(T(I(i,j),j)-T(I(i-1,N),N)-round((2^32)*X(I(i,j),j)),256);
        end
    end
    for i = 1
        for j = 1
        E(I(i,j),j)= mod(T(I(i,j),j)-E(I(M,N),N)-round((2^32)*X(I(i,j),j)),256);
        end
    end
%     figure
%     imshow(C);
end