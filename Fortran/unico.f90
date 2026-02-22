program unico
    integer,parameter :: n=10
    integer :: x(n)=[1,2,1,3,9,0,0,9,1,9],y
    do i=1,n
        y=x(i)
        if (all(y/=x(1:i-1))) print*,y
    end do
end program unico