clear all ,close all,   clc
xold = 0.5;
xvals=[];
for r=0:0.001:1
    r
      for i=1:5000
        xnew = cos(pi*((4*r*(xold)^2-4*r*xold)+((1-r)*sin(pi*xold))-0.5));
        xold = xnew;
      end
%       xnew=xold;
      xss=xnew;
    for i=0:1:5000
        xnew = cos(pi*((4*r*(xold)^2-4*r*xold)+((1-r)*sin(pi*xold))-0.5));
        xold = xnew;
        xvals(1,length(xvals)+1) = r;
        xvals(2,length(xvals)) = xnew;
        if(abs(xnew-xss)<0.001)
            break
        end
    end
end

plot(xvals(1,:),xvals(2,:),'.','LineWidth',.1,'MarkerSize',1.2,'Color',[0.15 0.4 1])
set(gca,'color','k','xcolor','w','ycolor','w')
set(gcf,'color','k')
xlabel('beta');
ylabel('x');
