program sumatoriodoble
    integer,allocatable :: v(:),w(:)
    print '("n?",$)'
    read*,n
    allocate(v(n),w(n))
    print*,'("v?",$)'
    read*,v
    print*,'("w?",$)'
    read*,w

    s=0
    do i=1,n
        s=s+v(i)*sum(w(1:i))
    end do
    print*, '("s=",i0)',s
    deallocate(v,w)
end program sumatoriodoble