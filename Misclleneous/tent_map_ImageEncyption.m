I=imread('cameraman.tif');
I=im2bw(I,0.5);
[a,b] = size(I);
N=a*b;
u=1.999;
x(1)=0.5;
for i=1:N
        if x(i) < 0.5 %and condition
            x(i+1)=u*x(i); %is it right
        else
            if x(i) >= 0.5 %and this condition 
            x(i+1)=u*(1-x(i)); %is it right
            end
        end
    end
k=xor(x(i+1),I);
imshow(k);
