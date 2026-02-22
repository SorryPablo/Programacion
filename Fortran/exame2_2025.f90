program exame
    integer,parameter :: n=2,m=3
    integer :: subprog
    real :: b(n,m)=reshape([0.5,-2.1,2.9,-1.4,5.0,-8.7],[n,m]),a(n,m)
    print '("a[:]?",$)'
    do i=1,n
        read *,a(i,:)
    end do
    print*, 'b='
    do i=1,n
        print *, b(i,:)
    end do
    k=subprog(a,b,n,m)
end program exame
!-------------------
integer function subprog(a,b,n,m) result(k)
    real,intent(in) :: a(n,m),b(n,m)
    integer,intent(in) :: n
    u=sum(a)/2;k=0;s=0
    filas: do i=1,n
        do j=1,m
            if(a(i,j)>b(i,j)) then
                s=s+a(i,j);k=k+1
                if (s>u) exit filas
            end if
        end do
    end do filas
end function subprog