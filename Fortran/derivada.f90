program derivada
    real,parameter :: a=0,b=10
    f(x)=exp(-x)*sin(2*x)
    x=a;h=0.01
    open(1,file='derivada.txt')
    do 
        write (1,*) x,f(x),(f(x+h)-f(x))/h
        x=x+h
        if(x>b) exit
    end do
    close(1)
end program derivada