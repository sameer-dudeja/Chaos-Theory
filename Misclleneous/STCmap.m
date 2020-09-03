clear all ,close all,   clc

xvals=[];
for r=0:0.001:1
    r
    xold = 0.5;
      for i=1:5000
        if(xold<0.5)         
            xnew = cos(pi*((r*sin(pi*xold))+(2*(1-r)*xold)-0.5));
        else
            xnew = cos(pi*((r*sin(pi*xold))+(2*(1-r)*(1-xold))-0.5));
        end
        xold = xnew;
      end
%       xnew=xold;
      xss=xnew;
    for i=0:1:5000
        if(xold<0.5)         
            xnew = cos(pi*((r*sin(pi*xold))+(2*(1-r)*xold)-0.5));
        else
            xnew = cos(pi*((r*sin(pi*xold))+(2*(1-r)*(1-xold))-0.5));
        end
        xold = xnew;
        xvals(1,length(xvals)+1) = r;
        xvals(2,length(xvals)) = xnew;
        if(abs(xnew-xss)<0.001)
            break
        end
    end
end

plot(xvals(1,:),xvals(2,:),'.','LineWidth',.1,'MarkerSize',1.2,'Color',[0 0 0])
set(gca,'color','w','xcolor','k','ycolor','k')
set(gcf,'color','w')
xlabel('beta');
ylabel('x');
