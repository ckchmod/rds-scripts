function P = PoissonDist(lambda,x)
    %Poisson distribution P(X = x)
    
    P = lambda^x*exp(-1*lambda)/factorial(x);

end