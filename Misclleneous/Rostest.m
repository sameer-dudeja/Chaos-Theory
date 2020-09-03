function [C] = Rostest(T,L)
    % img = (imread('im3.jpg'));
    % T = img;
    [M,N,K] = size(T);
    T= imrotate(T,90);
    T = im2double(T);
    % L=1024;
    % xold = 0.8;
    X = lsc_py(L,0.4647,0.6515);
    [X1,I] = sort(X);
    C = ones(L,L);
    for i = 1
        for j = 1
        C(I(i,j),j)= mod(T(I(i,j),j)+T(I(M,N),N)+round((2^32)*X1(I(i,j),j)),256);
        end
    end

    for i = 2:N
        for j = 1            
        C(I(i,j),j)= mod(T(I(i,j),j)+C(I(i-1,N),N)+round((2^32)*X1(I(i,j),j)),256);
        end
    end

    for i = 1:N
        for j = 2:N
        C(I(i,j),j) = mod(T(I(i,j),j)+C(I(i,j-1),j-1)+round((2^32)*X1(I(i,j),j)),256);
        end
    end
%     figure
%     imshow(C);
%     xlabel('ROS_test');
end