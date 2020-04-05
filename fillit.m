function z = fillit(n1,n2,x0,mu)
    x = x0;  %# initial x value
    z = linspace(0.0,1.0,n1-n2);  %# create an array
    for i = 1:n1  %# do n1 iterations
        x = hua_logistic(x,mu);
    end
    for i =1:n2-n1% fill n2-n1 iterations
        x = hua_logistic(x,mu);
        z(i) = x;
    end
end