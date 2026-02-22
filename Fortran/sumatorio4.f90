program sumatoriodoble
    integer,allocatable :: v(:),w(:)
    print '("n?",$)'
    read*,n
    allocate(v(n),w(n))
    print*,'("v?",$)'
    read*,v
    print*,'("w?",$)'
    read*,w

    s=0;t=0
    do i=1,n
        t=t+w(i);s=s+v(i)*t
    end do
    print*,'s=',s
    deallocate(v,w)
end program sumatoriodoble