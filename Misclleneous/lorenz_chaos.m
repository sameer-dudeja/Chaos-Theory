clear all, close all, clc
beta = [9;28;8/3];
x0 = [0; 1;20];
dt = 0.001;

tspan =dt:dt:50;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,beta),tspan,x0,options);

plot3(x(:,1),x(:,2),x(:,3),'w','LineWidth',1.5);
set(gca,'color','k','xcolor','w','ycolor','w','zcolor','w');
set(gcf,'color','k');
colormap jet
