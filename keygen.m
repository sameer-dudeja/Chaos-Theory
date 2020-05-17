% clc
% myStream=RandStream('dsfmt19937');
function [Key] = keygen(myStream,N)
kkey = rand(myStream,1,256);
x0 = 0;p0 = 0;d = 0;g = 0;h1 = 0;h2 = 0;h3 = 0;h4 = 0;
x= zeros(1,256);
    for i=1:256
        k = float2bin(kkey(i));
        x(i) = str2double(k);
    %     x(i) = single(x(i));
    end
    xval = x(1:32);
    pval = x(33:64);
    dval = x(65:96);
    gval = x(97:128);
    h1val = x(129:160);
    h2val = x(161:192);
    h3val = x(193:224);
    h4val = x(225:256);
    for i=1:32
       x1 = (xval(i)*(2^-(xval(i)))+x0);
       x0 = x1;
       p1 = (pval(i)*(2^-(pval(i)))+p0);
       p0 = p1;
       d1 = (dval(i)*(2^-(dval(i)))+d);
       d = d1;
    end
    for i=1:32
       h11 = (h1val(i)*(2^(h1val(i)-1))+h1);
       h1 = h11;
       h21 = (h2val(i)*(2^(h2val(i)-1))+h2);
       h2 = h21;
       h31 = (h3val(i)*(2^(h3val(i)-1))+h3);
       h3 = h31;
       h41 = (h4val(i)*(2^(h4val(i)-1))+h4);
       h4 = h41;
       g1 = (gval(i)*(2^-(gval(i)))+g);
       g = g1;
    end
    g = single(g);
    h1 = single(h1);
    h2 = single(h2);
    h3 = single(h3);
    h4 = single(h4);     
   Key = [x1; p1; d; g; h1; h2; h3; h4;];
end