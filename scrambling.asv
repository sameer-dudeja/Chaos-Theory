% clear all ,close all,   clc
% myStream=RandStream('dsfmt19937');
% img=(imread('image2.jpg'));
% red = img(:,:,3);
% a = zeros(size(img,1),size(img,2));
% just_red = cat(3,red,a,a);
% imshow(just_red);
function [T] = scrambling(img,X)
    [M,N]=size(img);
    m = M;
    n = N; 
    l = min(floor(sqrt(m)),floor(sqrt(n)));
    L=l*l;
    [A,IA] = sort(X(1:(L)));                  %sorting by rows
    [B,IB] = sort(X(L+1:2*L));
    [Y,IY] = sort(X(2*L+1:3*L));
    [Z,IZ] = sort(X(3*L+1:4*L));
    T = img;
    O = [L,L];
    Q = [L,L];
        for j = 1:L
            for i = 1:L
                m = (mod((i+IB(j)-1),L))+1;
                n = (mod((i+IZ(j)-1),L))+1;
                O(i,j) = IA(m);
                Q(i,j) = IY(n);
            end
        end
        for i = 1:L
            for j = 1:L
                a = O(i,j);
                b = Q(a,j);
                m1 = floor(((a-1)/l));
                n1 = mod((a-1),l);
                m2 = floor(((b-1)/l));
                n2 = mod((b-1),l)+1;
                x = m1*l+m2+1;
                y = n1*l+n2;
                T(x,y) = img(i,j);
            end
        end
end
