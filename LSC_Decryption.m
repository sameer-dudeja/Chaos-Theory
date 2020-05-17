function K = LSC_Decryption(Key,E)
% zE = imread('encr.jpg');
  [m,n,k]=size(E);
    l = min(floor(sqrt(m)),floor(sqrt(n)));
    L=l*l;
    for N = 1:4
        if(N==1)
                X0 = single(mod((Key(1)*Key(4)+Key(3)*Key(5)),1));
                P0 = single(mod((Key(2)*Key(4)+Key(3)*Key(5)),1));
                X0
                P0
        end
        if(N==2)
                X0 = single(mod((Key(1)*Key(4)+Key(3)*Key(6)),1));
                P0 = single(mod((Key(2)*Key(4)+Key(3)*Key(6)),1));
                X0
                P0
        end
        if(N==3)
                 X0 = single(mod((Key(1)*Key(4)+Key(3)*Key(7)),1));
                 P0 = single(mod((Key(2)*Key(4)+Key(3)*Key(7)),1));
                 X0
                 P0
        end
        if(N==4)
                 X0 = single(mod((Key(1)*Key(4)+Key(3)*Key(8)),1));
                 P0 = single(mod((Key(2)*Key(4)+Key(3)*Key(8)),1));
                 X0
                 P0
        end
         X = lsc_py(4*L,X0,P0);
         X1 = lsc_py(L,X0,P0);
%         if(k==3)
%             red = E(:,:,1);
%             green = E(:,:,2);
%             blue = E(:,:,3);
%             C1 = uint8(ROS_Decryp(red,X1,L));
%             C2 = uint8(ROS_Decryp(green,X1,L));
%             C3 = uint8(ROS_Decryp(blue,X1,L));
%             
%             C = cat(3,C1,C2,C3);
%             imrotate(C,90);
%              red = C(:,:,1);
%             green = C(:,:,2);
%             blue = C(:,:,3);
%             T1 = decry_scramb(red,X);
%             T2 = decry_scramb(green,X);
%             T3 = decry_scramb(blue,X);
%             T = cat(3,T1,T2,T3);
%         else
            C = (ROS_Decryp(E,X1,L)); 
            imrotate(C,-90);
            T = decry_scramb(C,X); 
%         end
        E = T;
    end
    K = T;
end