P = [11 12 13 14;21 22 23 24; 31 32 33 34; 41 42 43 44];
O = [2 1 4 3; 4 2 3 1; 3 4 1 2; 1 3 2 4];
Q = [3 1 2 4; 4 2 3 1 ; 1 3 4 2; 2 4 1 3];
l = 2;
L =4;
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
                T(x,y) = P(i,j);
            end
end
for i = 1:L
            for j = 1:L
                a = O(i,j);
                b = Q(a,j);
                m1 = floor(((a-1)/l));
                n1 = mod((a-1),l);
                m2 = floor(((b-1)/l))+1;
                n2 = mod((b-1),l)+1;
                x = m1*l+m2;
                y = n1*l+n2;
                K(i,j) = T(x,y); 
            end
end