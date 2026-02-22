program simulacro
    real,allocatable :: x(:),y(:)
    print*,'n?'
    read*,n
    allocate(x(n),y(n))
    x(1)=1
    do i=2,n
        x(i)=sqrt(abs(x(i-1)+i*(-1)**i))
    end do
    call subprog(x,y,n)
    print '("x(i)=",$)'
    do i=1,n
        print '(1f6.2," ",$)',x(i)
    end do
    print*, ' '
    print '("y(i)=",$)'
    do i=1,n
        print '(1f6.2," ",$)',y(i)
    end do
    deallocate(x,y)
end program simulacro
!-------------------
subroutine subprog(x,y,n)
    real,intent(in) :: x(n)
    real,intent(out) :: y(n)
    integer,intent(in) :: n
    do i=1,n
        if (mod(i,2)==0) then
            y(i)=sum(x(2:i:2))
        else
            y(i)=sum(x(1:i+1))
        end if
    end do
end subroutine subprog