
function [Z] = lsc_py(L,x0,mu_min)
  muarr = linspace(mu_min,1.0,L);  
        n1=L;  %#specify iteration range
        n2=2*L;  
        Z = ones(L,L);
        for i = 1:L  
            mu = muarr(i);
            y = fillit(n1,n2,x0,mu);  %# get the array of iterations
%             x = y*0.0+ mu; %# dummy x value is all mu
            Z(i,:) = y;
%             plot(x,y,'r.'); 
%             hold on
        end
end
   
       
            