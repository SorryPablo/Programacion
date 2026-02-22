program intervalos
    implicit none
    real :: x,f
    logical :: m=.TRUE.
    print '("x=?",$)'
    read*,x
    do while (m)
        if (0>=x) then
            f=x+1
        else if (0<x.and.x<1) then
            f=x
        else if (1<=x.and.x<=2) then
            f=2-x
        else if (2<x) then
            f=3*x-x**2
        end if
        print *, 'x =', x, ' -> f(x) =', f
        x=x+0.01
        if (4<x) then
            m=.FALSE.
        end if
    end do
end program intervalos