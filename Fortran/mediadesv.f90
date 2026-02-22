program mediadesv
    integer,parameter :: n=7
    integer :: x(n)=[8,3,1,2,7,9,5]
    real :: m,v
    v=0

    !media-----------------------------------
    m= sum(x)/n
    print*, 'media=',m

    !varianza bucle--------------------------
    do i=1,n
        v=v+(x(i)-m)**2
    end do
    v=v/(n-1)
    print*,'varianza=',v

    !varianza vectorizada--------------------
    print*,'varianza=', sum((x-m)**2)/(n-1)
    
    !desviación típica-----------------------
    print*, 'desviacion tipica=',sqrt(v)

end program mediadesv