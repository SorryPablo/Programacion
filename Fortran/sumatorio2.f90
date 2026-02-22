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
            t=t+w(j)
        end do
        s=s+v(i)*t
    end do
    print*, '("s=",i0)',s
    deallocate(v,w)
end program sumatoriodoble