function [C] = ROS(T,xold,L,R)
    % img = (imread('im3.jpg'));
    % T = img;
    [M,N,K] = size(T);
    T = im2double(T);
    imrotate(T,90);
    % L=1024;
    % xold = 0.8;
    X = lsc_py(L,xold,R);
    [X,I] = sort(X,2);
    C = ones(L,L);
%     pp = I(N,N)
    for i = 1
        for j = 1
%             d = round((2^32)*X(i,j));
%             d
        C(I(i,j),j)=    mod(T(I(i,j),j)+T(I(M,N),N)+round((2^32)*X(i,j)),256);
%         C(I(i,j),j)
        end
    end

    for i = 2:N
        for j = 1
            d = C(I(i-1,N),N)+round((2^32)*X(i,j));
      
            k = I(i,j);
            
            p = T(k,j);
            
            pp = p+d;
            
            ppp = mod(pp,256);
            
        C(I(i,j),j)=  ppp;
        
%         C(I(i,j),j)
        end
    end
%     C = D;
%     p =0;
    for i = 1:N
        for j = 2:N
%             d = round((2^32)*X(i,j));
%             d
            d = round((2^32)*X(i,j));
%             d
            k = C(I(i,j-1),j-1);
%             k
            p = T(I(i,j),j);
            pp =p+d+k;
%             p
        pppp =    mod(pp,256);
        C(I(i,j),j) = pppp;
        end
    end
%     figure
%     imshow(C);
end