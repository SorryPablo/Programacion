program norma
    real,allocatable :: v(:)
    print*,'("n=",$)'
    read*,n
    allocate(v(n))
    print '("v[]?",$)';read*,v

    do i=1,n
        s=s+v(i)**2
    end do
    r=sqrt(s)
    print*,r

    deallocate(v)
endprogram norma