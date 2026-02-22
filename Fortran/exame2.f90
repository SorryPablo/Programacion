program exame
    integer,allocatable :: x(:)
    integer :: n
    print*, '("n=?",$)'
    read*,n
    allocate(x(n))
    print*, '("x=?",$)'
    read*, x
    call subprog(x,n,m,k)
    print '("m=",i0,"k=",i0)',m,k
    open(1,file='cli3.txt')
    do i=1,n
        write(1,*) i,m*x(i)+k
    end do
end program exame

subroutine subprog(x,n,m,k)
    integer,intent(inout) :: x(n),n
    integer,intent(out) :: m,k
    m=0;k=0;i=1
    do
        if (x(i)>n) then
            x(i)=x(i)-n
            m=m+1
            k=k+1
        else if (x(i)<1) then
            x(i)=x(i)+n
            k=k+1
        end if
    end do
    do while(k<10*m)
        if(i==n) then
            i=0
        end if
        i=i+1
    end do
end subroutine subprog