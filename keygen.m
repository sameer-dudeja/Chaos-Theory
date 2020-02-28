function [X0,P0] = Keygen(myStream)
key = rand(myStream,1,256);
x0 = 0;
p0 = 0;
d = 0;
g = 0;
h1 = 0;
h2 = 0;
h3 = 0;
h4 = 0;
x= zeros(1,256);
for i=1:256
    k = float2bin(key(i));
    x(i) = str2double(k);
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
   x0 = (xval(i)*(2^-(xval(i)))+x0);
   p0 = (pval(i)*(2^-(pval(i)))+p0);
   d = (dval(i)*(2^-(dval(i)))+d);
end
for i=1:32
   h1 = (h1val(i)*(2^(h1val(i)-1))+h1);
   h2 = (h2val(i)*(2^(h2val(i)-1))+h2);
   h3 = (h3val(i)*(2^(h3val(i)-1))+h3);
   h4 = (h4val(i)*(2^(h4val(i)-1))+h4);
   g = (gval(i)*(2^-(gval(i)))+g);
end
% h1 = round(h1);
% h2 = round(h2);
% h3 = round(h3);
% h4 = round(h4);
g = round(g);
X0 = rem((x0*g+d*h2),1);
P0 = rem((p0*g+d*h2),1);

   