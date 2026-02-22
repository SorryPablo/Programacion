program mediadesv
    integer,parameter :: n=7
    integer :: x(n)=[8,3,1,2,7,9,5]
    real :: m,m0
    m=sum(x)/n;v=sum((x-m)**2)/(n-1);d=sqrt(v)
    print*,'media',m,'varianza=',v,'desviacion tipica=',d

    ! Welford----------------------------------
    m=x(1);v=0;w=0;d=0
    do i=1,n-1
        m0=m;m=m+(x(i+1)-m)/(i+1)
        w=w+(x(i+1)-m0)*(x(i+1)-m) 
    end do
    v=w/(n-1)
    d=sqrt(v)  
    print*,'media',m,'varianza=',v,'desviacion tipica=',d
end program mediadesv