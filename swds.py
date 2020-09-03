
# plot periodic orbits and iterations for the logistic map  
# 
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import math
n1=100  #specify iteration range
n2=200 
mu_min=0.0
x=0;
mu_max = 1.0  # maximum mu value
muarr = np.linspace(mu_min,mu_max,1000) 
z = np.linspace(0.0,1.0,n2-n1)
# logistic map is f(x) = mu*x*(1-x)  with mu in (0,4)
def hua_stc(x,mu):
   # y = 4*mu*x*(1.0-x)
   y=math.cos(3.14*(4*mu*x*(1-x)+(1-mu)*math.sin(3.14*x)-0.5));
  # if x < 0.5:
   # y=math.cos(3.14*(mu*math.sin(3.14*x)+2*(1-mu)*x-0.5))
   #else:
    #    y=math.cos(3.14*(mu*math.sin(3.14*x)+2*(1-mu)*(1-x)-0.5)) 
        
   return y 

# fill an array with iteration n1 to n2 of the logistic map starting with x0
# and with parameter mu
def fillit(n1,n2,x0,mu):
    x = x0  # initial x value
    z = np.linspace(0.0,1.0,n2-n1)  # create an array
    for i in range(0,n1):   # do n1 iterations
        x = hua_stc(x,mu)

    for i in range(0,n2-n1):   # fill n2-n1 iterations
        x = hua_stc(x,mu)
        z[i] = x

    return z  # returning the array


# plot the iterated logistic map for nmu number of mu values
def mkplot(mu_min,nmu):  # nmu is number of mu values to use, mu_min range 
#	mu_max = 4.0  # maximum mu value
         
         
        x0=0.1  # initial x
        for i in range(0,nmu):  
            mu = muarr[i]
            y=fillit(n1,n2,x0,mu)  # get the array of iterations
            x=y*0.0 + mu   # dummy x value is all mu 
            plt.plot(x,y,'r.',markersize=0.25)   # k=black, plot small points
#		plt.plot(x,y,markercolor='red', marker='o',markersize=1)   # k=black, plot small points
        print(*muarr)    

params = {'legend.fontsize': 'x-large',
         'axes.labelsize': 'x-large',
         'axes.titlesize':'x-large',
         'xtick.labelsize':'x-large',
         'ytick.labelsize':'x-large'}

matplotlib.rcParams.update(params)
plt.figure()
plt.xlabel(r'$r$',fontsize=30)
plt.ylabel(r'$x_i$',fontsize=30)
plt.axis([mu_min, mu_max, 0, 1.0])
# this makes the plot!
mkplot(mu_min,1000)

plt.tight_layout()
plt.savefig("hua_bifurcation.png")
plt.show()
