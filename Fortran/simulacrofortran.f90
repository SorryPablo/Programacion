program clil6
    real,allocatable :: y(:),x(:)
    real :: k
    open(1,file='exame6.txt',status='old',err=1)
    read(1,*) n
    allocate(x(n),y(n))
    read(1,*) x
    close(1)
    y(1)=(x(1)+x(2))/2
    y(n)=(x(n-1)+x(n))/2
    do i=2,n-1
        y(i)=sum(x(i-1:i+1))/3
    end do
    k=subprog(x,y,n)
    print*,'k=',k
    print '("x(i)=",$)'
    do i=1,n
        print '(1f4.2," ",$)',x(i)
    end do
    print*, ''
    print '("y(i)=",$)'
    do i=1,n
        print '(1f4.2," ",$)',y(i)
    end do
    deallocate(x,y)
    stop
1   stop 'erro de lectura'
end program clil6
!--------------------
real function subprog(x,y,n) result(k)
    real,intent(in) :: x(n),y(n)
    integer,intent(in) :: n
    k=0
    do i=1,n,2
        do j=2,n-i,2
            k=k+x(i+j)*y(i+j) !Vectorizado: k=k+sum([(x(i+j)*y(i+j),j=2,n-i,2)]),ou, k=k+sum(x(i+2:n:2)*y(i+2:n:2))
        end do
    end do
end  function subprog