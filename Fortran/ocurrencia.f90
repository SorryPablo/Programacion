program ocurrencia
    integer,allocatable :: v(:)
    print '("n?",$)'
    read*,n
    allocate(v(n))
    print '("v(n)?",$)'
    read*,v
    print'("m?",$)'
    read*,m

    k=0
    do i=1,n
        if(v(i)==m) then 
            print*,i
            k=k+1
        end if
    end do
    print*,k
    deallocate(v)
end program ocurrencia