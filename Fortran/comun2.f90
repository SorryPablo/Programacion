program comun
    integer,parameter :: nx=6, ny=5
    integer :: x(nx)=[1,8,2,9,0,6],y(ny)=[5,1,8,2,7]
    integer,allocatable :: z(:)
    allocate(z(0))

    do i=1,nx
        k=x(i)
        if (any(k==y)) z=[z,k]
    end do
    print*, 'comuns=',z
end program comun