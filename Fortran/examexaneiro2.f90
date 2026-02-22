program xaneiro2
    real,allocatable :: x(:),y(:)
    integer :: n,calcula
    open(1,file='datos2_fortran.txt',status='old',err=1)
    read(1,*) n
    allocate(x(n),y(n))
    do i=1,n
        read(1,*) x(i)
    end do
    do i=1,n
        y(i)=x(n-i+1)/i
    end do
    print*, 'x=',x
    print*, 'y=',y
    m=calcula(x,n)
    print '("k=",i5)',m
    close(1)
    stop
1   stop 'error de lectura'
end program xaneiro2

function calcula(x,n) result(k)
    integer,intent(in) :: n
    real,intent(in) :: x(n)
    real :: sum,z(n),u,s
    integer :: k
    u=0;sum=0;s=0;k=0
    do i=1,n
        sum=sum+x(i)
        z(i)=sum
    end do
    do j=1,n
        u=u+z(j)*z(j)
    end do
    i=1
    do
        s=s+z(i)
        k=k+1
        if(u<s) exit
        if(i>=n) then
            i=1
        else
            i=i+1
        end if
    end do
end function calcula