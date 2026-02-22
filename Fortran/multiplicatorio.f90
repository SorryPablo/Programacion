program multiplicatorio

    real,parameter :: pi=3.141592

    print*,'("n,x?",$)'
    read*,n,x
    p=2**(n-1); t=pi/2/n

    do k=1,n
        p=p*(x-cos((2*k-1)*t))
    end do

    print*,'"p=",$',p

end program multiplicatorio