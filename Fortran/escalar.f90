program escalar
    real,allocatable :: v(:),w(:)
    real :: esc
    print*,'"n?",$'
    read*,n
    allocate(v(n),w(n))
    print*,'("v?",$)'
    read*,v
    print*,'("w?",$)'
    read*,w

    esc=0
    do i=1,n
        esc=esc + (v(i)+w(i))
    end do
    print*,esc
end program escalar