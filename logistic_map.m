clear all, close all, clc

xvals=[];
for beta =0:0.1:4
    beta
    xold = 0.5;
    for i=1:2000
        xnew = ((xold-xold^2)*beta);
        xold = xnew;
    end
    xss = xnew;
    for i=1:1000
        xnew = ((xold-xold^2)*beta);
        xold=xnew;
        xvals(1,length(xvals)+1) = beta;
        xvals(2,length(xvals)) = xnew;
        if(abs(xnew-xss)<0.001)
            break
        end
    end
end    
        
plot(xvals(1,:),xvals(2,:),'.','LineWidth',.1,'MarkerSize',1.2,'Color',[1 1 1])
set(gca,'color','k','xcolor','w','ycolor','w')
set(gcf,'color','k')
xlabel('beta');
ylabel('x');