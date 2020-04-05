function y = hua_logistic(x,mu)
%     y=cos(3.14*(4*mu*x*(1-x)+(1-mu)*sin(3.14*x)-0.5));
if (x < 0.5)
    y=cos(3.14*(mu*sin(3.14*x)+2*(1-mu)*x-0.5));
else
        y=cos(3.14*(mu*sin(3.14*x)+2*(1-mu)*(1-x)-0.5)) ;
end
end
