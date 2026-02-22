program expresions
    print '("x? ",$)'
    read *,x
    
    print *,x
    print '("3x-1=",f6.3)',3*x-1
    print '("x^2+sqrt(x-2)=",f6.3)',x**2+sqrt(x-2)
    print '("(sin(x)-3)/(ln(x)+exp(x)-1)=",f6.3)',(sin(x)-3)/(log(x)+exp(x)-1)
end program expresions