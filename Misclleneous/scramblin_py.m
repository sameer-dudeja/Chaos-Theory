clear all ,close all,   clc
myStream=RandStream('dsfmt19937');
Image=(imread('image2.jpg'));
[M,N,K]=size(Image);
C = ones(M,N);
m = M;
n = N;
l = min(floor(sqrt(m)),floor(sqrt(n)));
L=l*l;
X=ones(1,L);
[xold,R] = keygen(myStream);
X = lsc_py;
[A,IA] = sort(X(1:(L)));
[B,IB] = sort(X(L+1:2*L));
[Y,IY] = sort(X(2*L+1:3*L));
[Z,IZ] = sort(X(3*L+1:4*L));
T = Image;
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
        T(x,y) = Image(i,j);
    end
end
figure
imshow(T);
figure
imshow(Image);
% X = reshape(X,M,N);
% imrotate(T,90);
% [X_sort,XI] = sort(X);
% for i = 1
%     for j = 1
%     C(XI(i,j),j)=    T(XI(i,j),j)+T(XI(M,N),N)+floor((2^32)*X(i,j));
%     end
% end

% for i = 2:N
%     for j = 1
%     C(XI(i,j),j)=    T(XI(i,j),j)+C(XI(1-N,N),N)+floor((2^32)*X(i,j));
%     end
% end
% for i = 1:N
%     for j = 2:N
%     C(XI(i,j),j)=    T(XI(i,j),j)+C(XI(i,j-1),j-1)+floor((2^32)*X(i,j));
%     end
% end
% figure
% imshow(C);
