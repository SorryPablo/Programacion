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
        t=0
        do j=1,i
            t=t+v(i)*w(j)
        end do
        s=s+t
    end do
    print*,'s=',s
    deallocate(v,w)
end program sumatoriodoble