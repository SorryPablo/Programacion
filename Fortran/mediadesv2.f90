program mediadesv
    integer,parameter :: n=7
    integer :: x(n)=[8,3,1,2,7,9,5]
    real :: m
    m=sum(x)/n;v=sum((x-m)**2)/(n-1);d=sqrt(v)
    print*,'media',m,'varianza=',v,'desviacion tipica=',d
end program mediadesv